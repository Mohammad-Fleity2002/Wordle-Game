import json

with open('fruits_dictionary.json', 'r') as f:
    data = json.load(f)
fruits_with_5_letters = [fruit for fruit in data['fruits'] if len(fruit) == 5]
filtered_data = {"description": "A list of fruits with 5 letters.", "fruits": fruits_with_5_letters}
with open('fruits.json', 'w') as f:
    json.dump(filtered_data, f, indent=4)
