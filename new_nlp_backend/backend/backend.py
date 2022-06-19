import gc
import os
import pickle
import numpy as np
from fastapi import FastAPI, File, UploadFile
from sklearn.feature_extraction.text import CountVectorizer


app = FastAPI()

labels = {
    0: "anger",
    1: "fear",
    2: "happiness",
    3: "love",
    4: "sadness",
}


@app.get("/")
def home():
    return {"message": "Please refer to the README for more information."}


@app.post("/predict")
async def predict(text: str):

    count_vect = CountVectorizer()
    extracted = count_vect.fit_transform([text])

    model = pickle.load(open("model.pickle", 'rb'))
    y_pred = model.predict(extracted)

    return {"category": labels[y_pred]}