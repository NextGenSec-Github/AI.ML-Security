from collections import Counter
import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from collections import Counter
import string
from sklearn.feature_extraction.text import ENGLISH_STOP_WORDS

data = pd.read_csv("your_file_path_to_dataset")

# Class Balance Analysis
class_counts = data['label'].value_counts()
# Plot the class distribution
plt.figure(figsize=(10, 5))
sns.barplot(x=class_counts.index, y=class_counts.values)
plt.title('Class Distribution')
plt.ylabel('Frequency')
plt.xlabel('Class Labels')
# plt.show()

# Find the mose common words in ham and spam data
def get_most_common_words(class_label, num_words, column_name, dataset):
  text = " ".join(message for message in dataset[dataset['label'] == class_label][column_name])
  text.lower()

  words = text.split()

  return Counter(words).most_common(num_words)

# print(get_most_common_words('spam', 20, 'text', data))


# Add a new text length feature
data['text_length'] = data['text'].apply(len)
# print(data.groupby('label')['text_length'].describe())


# Clean and remove punctuation from the data
def preprocess_text(text):
  text = text.lower()

  # Replace any punctiation e.g. !"#& etc with ""
  text = text.translate(str.maketrans("", "", string.punctuation))

  words = text.split()

  words = [word for word in words if word not in ENGLISH_STOP_WORDS]

  text = ' '.join(words)
  return text

data['cleaned_text'] = data['text'].apply(preprocess_text)


ham_words = get_most_common_words('ham', 20, 'cleaned_text', data)
spam_words = get_most_common_words('spam', 20, "cleaned_text", data)


# print(ham_words)
# print(spam_words)