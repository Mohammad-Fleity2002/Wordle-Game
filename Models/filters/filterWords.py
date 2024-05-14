import json

with open('words_dictionary.json', 'r') as f:
    data = json.load(f)

filtered_words = [word for word in data if len(word) == 5]

filtered_data = {"filtered_words": filtered_words}

with open('words.json', 'w') as f:
    json.dump(filtered_data, f, indent=4)
