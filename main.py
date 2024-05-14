import json
import os
import random


def read_json_files(folder_path):
    words_list = []
    for filename in os.listdir(folder_path):
        if filename.endswith(".json"):
            file_path = os.path.join(folder_path, filename)
            with open(file_path, 'r', encoding='utf-8') as f:
                data = json.load(f)
                description = data.get('description', '')
                words = data['words']
                # Store description with words
                words_list.append((description, words))
    return words_list

# Function to randomly select a word from each list


def select_random_words(words_list, limit=60):
    selected_words = {}
    selected_desc = {}
    total_selected = 0
    for description, words in words_list:
        if total_selected >= limit:
            break
        for i, word in enumerate(words):
            if total_selected >= limit:
                break
            selected_words["word" + str(total_selected)] = word
            selected_desc["desc" + str(total_selected)] = description
            # {
            #     "word": word,
            #     "description": description  # Add description to each selected word
            # }
            total_selected += 1
    return selected_words, selected_desc

# Main function


def main():
    json_folder_path = r"C:\xampp\htdocs\wordle\Models\CAPITAL_DATA"
    # path to models
    words_list = read_json_files(json_folder_path)

    if words_list:
        selected_words, selected_desc = select_random_words(words_list)

        nb_words = len(selected_words)
        res = {
            "status": "success",
            "message": "words imported",
            "size": nb_words,
            "words": selected_words,
            "word_desc": selected_desc
        }
    else:
        res = {"status": "failed", "message": "no words found"}

    print(json.dumps(res, indent=4))


if __name__ == "__main__":
    main()
