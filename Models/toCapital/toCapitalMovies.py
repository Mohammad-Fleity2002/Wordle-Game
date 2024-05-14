# import json

# # Load the JSON data
# with open(r'C:\xampp\htdocs\wordle\Models\filteredData\movies.json', 'r', encoding='utf-8') as f:
#     data = json.load(f)

# # Capitalize the titles of movies with 5 letters
# for movie in data['movies_with_5_letter_titles']:
#     movie['title'] = movie['title'].upper()

# # Write the modified data to a new JSON file
# with open('output.json', 'w', encoding='utf-8') as f:
#     json.dump(data, f, indent=4, ensure_ascii=False)
import json

# Load the JSON data
with open('output.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# Extract titles of movies with 5 letters
titles = [movie['title'] for movie in data['movies_with_5_letter_titles']]

# Create a dictionary for the extracted titles
extracted_data = {"movies": titles}

# Write the extracted titles to a new JSON file
with open('MOVIES.json', 'w', encoding='utf-8') as f:
    json.dump(extracted_data, f, indent=4, ensure_ascii=False)
