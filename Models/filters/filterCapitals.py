import json

# Load the JSON data
with open('capitals_dictionary.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# Filter cities with exactly 5 letters and convert them to uppercase
filtered_data = []
for item in data:
    # Get the value of 'city', or None if it doesn't exist
    city = item.get('city')
    # Check if 'city' is not None and has exactly 5 letters
    if city is not None and len(city) == 5:
        item['city'] = city.upper()  # Convert 'city' to uppercase
        filtered_data.append(item['city'])

# Write the filtered data to a new JSON file
with open('capitals.json', 'w', encoding='utf-8') as f:
    json.dump(filtered_data, f, indent=4, ensure_ascii=False)
