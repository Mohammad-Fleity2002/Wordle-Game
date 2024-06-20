import json

# Load the JSON data
# with open(r'C:\xampp\htdocs\wordle\Models\filteredData\movies.json', 'r', encoding='utf-8') as f:
# with open(r'C:\xampp\htdocs\wordle\Models\filteredData\vegetables.json', 'r', encoding='utf-8') as f:
# with open(r'C:\xampp\htdocs\wordle\Models\filteredData\words.json', 'r', encoding='utf-8') as f:
with open(r'C:\xampp\htdocs\wordle\Models\filteredData\cities.json', 'r', encoding='utf-8') as f:
    # with open(r'C:\xampp\htdocs\wordle\Models\filteredData\fruits.json', 'r', encoding='utf-8') as f:
    # with open(r'C:\xampp\htdocs\wordle\Models\filteredData\countries.json', 'r', encoding='utf-8') as f:
    # with open(r'C:\xampp\htdocs\wordle\Models\filteredData\companies.json', 'r', encoding='utf-8') as f:
    # with open(r'C:\xampp\htdocs\wordle\Models\filteredData\capitals.json', 'r', encoding='utf-8') as f:
    # with open(r'C:\xampp\htdocs\wordle\Models\filteredData\animals.json', 'r', encoding='utf-8') as f:
    # with open(r'C:\xampp\htdocs\wordle\Models\filteredData\cars.json', 'r', encoding='utf-8') as f:
    data = json.load(f)


# Convert car names to uppercase
# for i in range(len(data['movies'])):
#     data['movies'][i] = data['movies'][i].upper()
# for i in range(len(data['vegetables'])):
#     data['vegetables'][i] = data['vegetables'][i].upper()
# for i in range(len(data['words'])):
#     data['words'][i] = data['words'][i].upper()
for i in range(len(data['cities'])):
    data['cities'][i] = data['cities'][i].upper()
# for i in range(len(data['fruits'])):
#     data['fruits'][i] = data['fruits'][i].upper()
# for i in range(len(data['countries'])):
#     data['countries'][i] = data['countries'][i].upper()
# for i in range(len(data['companies'])):
#     data['companies'][i] = data['companies'][i].upper()
# for i in range(len(data['cities'])):
#     data['cities'][i] = data['cities'][i].upper()
# for i in range(len(data['cars'])):
#     data['cars'][i] = data['cars'][i].upper()
# for i in range(len(data['animals'])):
#     data['animals'][i] = data['animals'][i].upper()


# Write the modified data to a new JSON file
# with open('CARS.json', 'w', encoding='utf-8') as f:
# with open('ANIMALS.json', 'w', encoding='utf-8') as f:
# with open('CAPITALS.json', 'w', encoding='utf-8') as f:
# with open('COMPANIES.json', 'w', encoding='utf-8') as f:
# with open('COUNTRIES.json', 'w', encoding='utf-8') as f:
# with open('FRUITS.json', 'w', encoding='utf-8') as f:
# with open('WORDS.json', 'w', encoding='utf-8') as f:
with open('CITIES.json', 'w', encoding='utf-8') as f:
    # with open('VEGETABLES.json', 'w', encoding='utf-8') as f:
    # with open('MOVIES.json', 'w', encoding='utf-8') as f:
    json.dump(data, f, indent=4, ensure_ascii=False)
