import json

# Load the JSON data
with open('artists_dictionary.json', 'r') as f:
    data = json.load(f)

# Filter artists with 5 letters in their names
artists_with_5_letters = [artist["DisplayName"]
                          for artist in data if len(artist["DisplayName"]) == 5]

filtered_data = {"artists_with_5_letters": artists_with_5_letters}

# Write the filtered data to a new JSON file
with open('artists.json', 'w') as f:
    json.dump(filtered_data, f, indent=4)
