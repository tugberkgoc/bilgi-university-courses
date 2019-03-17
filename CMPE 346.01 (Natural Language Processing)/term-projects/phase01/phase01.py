import nltk
from nltk.probability import FreqDist
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
import pandas as pd

ps = PorterStemmer()

df = pd.read_csv("Reviews.csv")
saved_column = df['Text']

for text in saved_column:

    readTheText = text

    tokenized = nltk.word_tokenize(readTheText)

    tokenized_sentence = nltk.sent_tokenize(readTheText)

    distribution = FreqDist(tokenized)

    stop_words = set(stopwords.words("english"))

    filtered_sentence = list()

    for word in tokenized:
        if word not in stop_words:
            filtered_sentence.append(word)

    print("2)")
    print("================================================================")
    print("Tokenized Text")
    print("================================================================")
    print(tokenized)

    print("3)")
    print("================================================================")
    print("The words that are not stop words. ")
    print("================================================================")
    print(filtered_sentence)

    stem_words = list()
    print("4)")
    print("================================================================")
    print("STEM")
    print("================================================================")
    for x in filtered_sentence:
        stem_words.append(ps.stem(x))
    print(stem_words)

    print("5)")
    print("================================================================")
    print("Basic information about words. ")
    print("================================================================")
    print(FreqDist(stem_words))

    print("6)")
    print("================================================================")
    print("MOST COMMON 10 STEM")
    print("================================================================")
    stem_most_common_words = FreqDist(stem_words).most_common(10)
    print(stem_most_common_words)

    print("7)")
    print("================================================================")
    print("VISUALIZE")
    print("================================================================")
    (FreqDist(stem_words)).plot(30, cumulative=False)

    print("8)")
    print("================================================================")
    print("MORE THAN 10 LETTERS")
    print("================================================================")
    for x in tokenized:
        if len(x) >= 10:
            print(x)