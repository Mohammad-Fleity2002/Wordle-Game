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
    return json.dumps(res, indent=4)


def select_random_words(words_list, nb_words):
    selected_words = {f"word{i}": word for i, word in enumerate(
        random.sample(words_list[1], k=nb_words))}
    selected_desc = {f"desc{i}": words_list[0] for i in range(nb_words)}
    return selected_words, selected_desc


# Example usage:
json_file_path = r'C:\xampp\htdocs\wordle\Models\CAPITAL_DATA\ANIMALS.json'
# Selecting 10 words and descriptions
result = read_random_words(json_file_path, nb_words=20)
print(result)
