from preprocessing import data
import openai
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.neighbors import KNeighborsClassifier

openai.api_key = "your-openai-api-key"

# Defining features for training and validation
vectorizer = CountVectorizer()

x = vectorizer.fit_transform(data['cleaned_text'])
y = data['label_num']

x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=42)


# Preditions K Nearest Neighbors(KNN)
knn = KNeighborsClassifier(n_neighbors=5)
knn.fit(x_train, y_train)

# Test Accuracy
preds = knn.predict(x_test)
accuracy = sum(y_test.values == preds) / len(preds)

print(accuracy)


def classify_message(message):
  response = openai.chat.completions.create(
      model= "gpt-3.5-turbo",
      messages=[
          {"role": "system", "content": "Act as a spam detection algorithm for email classification task: Classify given email into spam/no_spam:"},
          {"role": "user", "content": message},
      ]
  )

  
  return response.choices[0].message.content.strip()

print(classify_message(data['text'].values[10]))
