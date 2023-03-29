import gc
import os
import pickle
import numpy as np
from pydantic import BaseModel
from fastapi import FastAPI, File, UploadFile
from sklearn.feature_extraction.text import CountVectorizer
from fastapi.middleware.cors import CORSMiddleware


app = FastAPI()

# Annoying CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

labels = {
    0: "anger",
    1: "fear",
    2: "happiness",
    3: "love",
    4: "sadness",
}


class DiaryText(BaseModel):
    text: str


@app.get("/")
def home():
    return {"message": "Please refer to the README for more information."}


@app.post("/predict")
async def predict(text: DiaryText):

    vector = pickle.load(open("new_nlp_backend/vector.pickle", 'rb'))
    model = pickle.load(open("new_nlp_backend/model.pickle", 'rb'))
    text = str(text)

    text_vector = vector.transform([text])
    y_pred = model.predict(text_vector)

    return {"category": labels[y_pred[0]]}
