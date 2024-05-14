import json

# Load the JSON data
with open('cities_dictionary.json', 'r') as f:
    data = json.load(f)

# Filter car manufacturers with 5 letters in their names
cities = [manufacturer["name"] for manufacturer in data if len(manufacturer["name"]) == 5]

# Create a dictionary for the filtered data
filtered_data = {"cities": cities}

with open('cities.json', 'w') as f:
    json.dump(filtered_data, f, indent=4)
