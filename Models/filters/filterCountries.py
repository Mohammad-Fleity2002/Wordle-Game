import json
with open('countries_dictionary.json', 'r') as f:
    data = json.load(f)

countries_with_5_letters = [country["name"] for country in data if len(country["name"]) == 5]

# Create a dictionary for the filtered data
filtered_data = {"countries": countries_with_5_letters}

# Write the filtered data to a new JSON file
with open('countries.json', 'w') as f:
    json.dump(filtered_data, f, indent=4)
