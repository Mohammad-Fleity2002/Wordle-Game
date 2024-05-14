import json

with open('vegetables_dictionary.json', 'r') as f:
    data = json.load(f)
fruits_with_5_letters = [
    fruit for fruit in data['vegetables'] if len(fruit) == 5]
filtered_data = {"description": "A vegetables with 5 letters.",
                 "vegetables": fruits_with_5_letters}
with open('vegetables.json', 'w') as f:
    json.dump(filtered_data, f, indent=4)
