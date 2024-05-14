import json
import random


def read_random_words(file_path, nb_words):
    try:
        with open(file_path, 'r') as file:
            data = json.load(file)
            description = data.get('description', '')
            words = data['words']
            # Store description with words
            words_list = (description, words)
            if words_list:
                selected_words, selected_desc = select_random_words(
                    words_list, nb_words)
                res = {
                    "status": "success",
                    "message": "words imported",
                    "size": len(selected_words),
                    "words": selected_words,
                    "word_desc": selected_desc
                }
            else:
                res = {"status": "failed", "message": "no words found"}
    except FileNotFoundError:
        res = {"status": "failed", "message": "file not found"}
    return res


def select_random_words(words_list, nb_words):
    selected_words = {f"word{i}": word for i, word in enumerate(
        random.sample(words_list[1], k=nb_words))}
    selected_desc = {f"desc{i}": words_list[0] for i in range(nb_words)}
    return selected_words, selected_desc


def merge_results(results, size):
    if results[0]['status'] == 'success' and results[1]['status'] == 'success':
        merged_result = {
            "status": "success",
            "message": "merged results",
            "size": sum_size(results, size),
            "words": update_word(results, size),
            "word_desc": update_desc(results, size)
        }
    else:
        merged_result = {"status": "failed", "message": "merge failed"}
    return json.dumps(merged_result, indent=4)


def sum_size(results, size):
    length = 0
    for result in results:
        length += result['size']
    return length


def update_word(results, size):
    counter = 0
    for j in range(size):
        if j == 0:
            merged_words = {f"word{i}": word for i,
                            word in enumerate(results[j]['words'].values())}
        else:
            counter = counter+len(results[j-1]['words'])
            merged_words.update(
                {f"word{i + counter}": word for i, word in enumerate(results[j]['words'].values())})
    return merged_words


def update_desc(results, size):
    counter = 0
    for j in range(size):
        if j == 0:
            merged_words = {f"desc{i}": word for i,
                            word in enumerate(results[j]['word_desc'].values())}
        else:
            counter = counter+len(results[j-1]['words'])
            merged_words.update(
                {f"desc{i + counter}": word for i, word in enumerate(results[j]['word_desc'].values())})
    return merged_words


# Example usage:
json_file_path = [
    (r'C:\xampp\htdocs\wordle\Models\CAPITAL_DATA\FRUITS.json', 5),
    (r'C:\xampp\htdocs\wordle\Models\CAPITAL_DATA\VEGETABLES.json', 5),
    (r'C:\xampp\htdocs\wordle\Models\CAPITAL_DATA\ANIMALS.json', 20)
]
result = list()
i = 0
for files, nb in json_file_path:
    result.append(read_random_words(files, nb))

merged_result = merge_results(result, 3)
print(merged_result)
