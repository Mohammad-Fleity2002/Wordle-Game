import json

with open('movies_dictionary.json', 'r', encoding='utf-8') as f:
    data = json.load(f)
movies_with_5_letter_titles = [
    movie for movie in data if len(movie["title"]) == 5]
filtered_data = {"movies_with_5_letter_titles": movies_with_5_letter_titles}
with open('movies.json', 'w') as f:
    json.dump(filtered_data, f, indent=4)
