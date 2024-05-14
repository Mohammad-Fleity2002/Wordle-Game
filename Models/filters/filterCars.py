import json

# Load the JSON data
with open('cars_dictionary.json', 'r') as f:
    data = json.load(f)

# Filter car manufacturers with 5 letters in their names
car_manufacturers_with_5_letters = [manufacturer["name"]
                                    for manufacturer in data if len(manufacturer["name"]) == 5]

# Create a dictionary for the filtered data
filtered_data = {
    "car_manufacturers_with_5_letters": car_manufacturers_with_5_letters}

# Write the filtered data to a new JSON file
with open('cars.json', 'w') as f:
    json.dump(filtered_data, f, indent=4)
