import json

# Load the JSON file
with open('animals_dictionary.json', 'r') as f:
    data = json.load(f)

# Filter words with 5 letters
filtered_animals = [animal for animal in data['animals'] if len(animal) == 5]

# Create a new dictionary with filtered animals
filtered_data = {"description": "A list of common types of animals with 5 letters", "animals": filtered_animals}

# Write the filtered data to a new JSON file
with open('animals.json', 'w') as f:
    json.dump(filtered_data, f, indent=4)
