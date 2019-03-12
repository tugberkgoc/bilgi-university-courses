import nltk# now, we have all the capabilites of nltk providing for us.
from nltk.probability import FreqDist
from nltk.corpus import stopwords
nltk.download('punkt')
nltk.download('stopwords')
first_word='Hello'
second_word="Merhaba"
text = """Hello Mr. Smith, how are you doing today?
        The weather is great, and city is awesome.
        The sky is pinkish-blue. You shouldn't eat cardboard"""
tokenized = nltk.word_tokenize(text)
tokenized_sentence = nltk.sent_tokenize(text)
distribution = FreqDist(tokenized)
stop_words =set(stopwords.words("english"))
filtered_sentence = list()# instead of []
for word in tokenized:
    if word not in stop_words:
        filtered_sentence.append(word)

print("The words that are not stop words. ")
print(filtered_sentence)
print("All the stop words of English language. ")
print(stop_words)

print("Basic information about words. ")
print(distribution)
print("The tokenized version of our text based on words. ")
print(tokenized)
print("Our tokenized text based on sentences. ")
print(tokenized_sentence)