from gensim.models import KeyedVectors

# Path to the downloaded Word2Vec model file
model_path = './model/GoogleNews-vectors-negative300.bin'

# Load the Word2Vec model
model = KeyedVectors.load_word2vec_format(model_path, binary=True)

# Now you can use the 'model' object to access the Word2Vec vectors


# import torch
# model = torch.load('model/GoogleNews-vectors-negative300.bin')
# print(model)
# from gensim.models import KeyedVectors
# # from scipy.linalg import triu


# # Path to the downloaded Word2Vec model file
# model_path = 'model/GoogleNews-vectors-negative300.bin'

# # Load the Word2Vec model
# model = KeyedVectors.load_word2vec_format(model_path, binary=True)
# Create an empty list to store words with five letters
# words_with_five_letters = []

# # Iterate over the vocabulary of the Word2Vec model
# for word in model.vocab:
#     # Check if the length of the word is five
#     if len(word) == 5:
#         # Add the word to the list
#         words_with_five_letters.append(word)

# Now you can use the model for various NLP tasks


# #If you don't have a dataset containing words and their descriptions, you can still leverage Word2Vec to generate a list of words along with their descriptions. However, keep in mind that Word2Vec itself doesn't provide descriptions for words. Therefore, you'll need to find a way to generate or collect descriptions for the words.

# One approach is to use Word2Vec to generate a list of words, and then manually or programmatically assign descriptions to each word. This could involve using external sources such as dictionaries, online APIs, or scraping websites for definitions or descriptions of words.

# Here's a general outline of how you can proceed:

# 1. **Generate Words with Word2Vec**: Use Word2Vec to generate a list of words. You can do this by extracting the vocabulary from the Word2Vec model or by generating new words based on the vectors in the model.

# 2. **Assign Descriptions**: For each generated word, assign a description. You can do this manually by brainstorming descriptions for each word, or you can automate the process by using external sources such as online dictionaries or APIs to retrieve definitions or descriptions.

# 3. **Store Words and Descriptions**: Store the generated words along with their descriptions in a suitable data structure, such as a list of tuples or a dictionary.

# 4. **Store in Database**: If you want to store the words and descriptions in a database, you can create a table with columns for the word, description, and any other relevant information.

# Here's a simplified example to illustrate the process:

# ```python
# from gensim.models import Word2Vec

# # Load or train Word2Vec model
# # model = Word2Vec.load('path_to_word2vec_model')

# # Generate list of words from Word2Vec model vocabulary
# words = list(model.wv.vocab.keys())

# # Assign descriptions to each word (simplified example)
# descriptions = {}
# for word in words:
#     # Here, you can manually assign descriptions or retrieve them from external sources
#     descriptions[word] = "Description for " + word

# # Store words and descriptions in a database
# # Example using SQLite
# import sqlite3

# conn = sqlite3.connect('words.db')
# c = conn.cursor()

# # Create table
# c.execute('''CREATE TABLE words
#              (word text, description text)''')

# # Insert data into table
# for word, description in descriptions.items():
#     c.execute("INSERT INTO words VALUES (?, ?)", (word, description))

# # Commit changes and close connection
# conn.commit()
# conn.close()
# # ```

# # In this example, replace `'path_to_word2vec_model'` with the path to your pre-trained Word2Vec model file. Adjust the code as needed based on your specific requirements and the format of your database.#
