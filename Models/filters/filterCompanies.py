import json
with open('companies_dictionary.json', 'r') as f:
    data = json.load(f)
comps = [country["name"] for country in data if len(country["name"]) == 5]
filtered_data = {"companies": comps}
with open('companies.json', 'w') as f:
    json.dump(filtered_data, f, indent=4)
