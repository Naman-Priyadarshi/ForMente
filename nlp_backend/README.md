## ForMente Backend

Emotion detection using Natural Language Processing.

## Description
The API uses a Naive Bayes classifier to classify emotions in 5 categories.
The classes (as used in the code) -
```py
labels = {
    0: "anger",
    1: "fear",
    2: "happiness",
    3: "love",
    4: "sadness",
}
```

## Usage
- The API can be accessed through the URL - https://formente.herokuapp.com/
- To predict an image's class, use the `/predict` endpoint
- For the complete documentation refer to - https://formente.herokuapp.com/docs

## Running locally
### To train the model locally -
1. Fork and clone the repository
```
git clone https://github.com/<your_username>/SceneNet-Backend
```
2. Create a new virtual environment
```
python -m venve .venv
```
3. Activate the virtual environment
```
.venv/Scripts/activate
```
4. Install requirements for training
```
python -m pip install -r nlp_backend/requirements.txt
```
5. Run the jupyter in the virtual environment
```
ipython kernel install --user --name=venv
# select the kernel named after your virtual environment in jupyter notebook
```
### To run the API locally-
1. Fork and clone the repository
```
git clone https://github.com/<your_username>/SceneNet-Backend
```
2. Create a new virtual environment
```
python -m venv .venv
```
3. Activate the virtual environment
```
.venv/Scripts/activate
```
4. Install requirements for training (the `Heroku` deployment uses `tensorflow-cpu` and `opencv-python-headless` because of the memory limitations, but you can switch to `tensorflow` and `opencv-python` if you are running this locally)
```
python -m pip install -r nlp_backend/requirements.txt
```
5. Fire up the API
```
uvicorn nlp_backend.backend.backend:app --reload
```
