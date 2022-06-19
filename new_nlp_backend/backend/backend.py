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

    vector = pickle.load(open("vector.pickle", 'rb'))
    model = pickle.load(open("model.pickle", 'rb'))

    text_vector = vector.transform([text])
    y_pred = model.predict(text_vector)

    return {"category": labels[y_pred[0]]}