# ForMente by CitizenFive

<p align="center">

  <img src="https://user-images.githubusercontent.com/77211855/174463614-67e3461b-6351-4307-be7a-10e1465b7e64.png" height=300/>
</p>

[![build-checks](https://github.com/Saransh-cpp/ForMente/actions/workflows/ci.yml/badge.svg)](https://github.com/Saransh-cpp/ForMente/actions/workflows/ci.yml)

By harnessing the power of Natural Language Processing, ForMente lets you diagnose what you are feeling in the form of a safe and secure personal diary.

Submission for the [Red Bricks Hackathon 2022](https://devpost.com/software/formente).

Built by [Saransh Chopra](https://github.com/Saransh-cpp), [Akash Rajoria](https://github.com/rajoriaakash), [Naman Priyadarshi](https://github.com/Naman-Priyadarshi), [Paritosh Chaturvedi](https://github.com/ooparitoshoo), and [Pratham Chauhan](https://github.com/ooprathamm)!

The NLP backend API is available here - https://formente.herokuapp.com/

## Inspiration
The first person that someone usually talks to about their mental health is themselves. This usually buries the person with self-doubt that becomes hard to cure. ForMente comes in between to diagnose a person's feelings through Natural Language Processing. It is a personal diary application that lets a user know how their daily emotions feel, through the text they note down in it.

## What it does
ForMente is a personal diary that allows users to write down their minds every day. These texts are stored securely in our database, and users can visit them whenever they want. The main aim of ForMente is to let the user know how they are feeling and that they are not overthinking it. To achieve this, the application runs natural language processing on the texts written by a user and shows them how they are feeling in real-time. All the data provided by a user is never accessed by anyone else and is secured safely in a database.

## How we built it
We built the application in 4 broad parts -

- The application
The application has been built using Flutter and Dart and is available on all Android devices. The UI has been taken utmost care of and is as smooth as it could be. This application is available through GitHub for everyone in the world.

- The model
The application uses a model to classify what a user is feeling. This is a Natural Language Processing model, and it was trained using scikit-learn and python. We started by training an LSTM neural network, but after spending around 12 hours on it, we couldn't get it to run on an Android device, due to the technical limitations. After this, we decided to switch to a lighter model, which could be deployed on the free dynos available at Heroku, and we succeeded!

- The Firebase and Firestore backend
The Firebase and Firestore backend holds information about a user and their diary entries. This information is kept safe in a remote server and is never shared with anyone. A user can login or sign up to the application using the Firebase backend, and can store their diary entries in the Firestore database. These entries are fetched in the application where a user can look back in the past. Additionally, a diary entry also holds the information about the emotion that a user was feeling while creating that entry.

- The NPL backend  
The NLP backend serves as a holder for our model. This was written using Python and FastAPI, and it has been deployed on Heroku. The backend API is completely free, independent of the other parts of the project, and easily accessible; hence, developers can use the backend API as a standalone product. The API takes in the text provided by an application and returns an emotion strongly correlated with the text.

## Screens
![Screens1](https://user-images.githubusercontent.com/74055102/174467290-9d5d125d-165c-45ff-9e5e-243d85bd16d5.png)
![Screens2](https://user-images.githubusercontent.com/74055102/174467292-c9985e47-b3d6-4fb9-988b-7c0c6951ea13.png)

## Video pitch
https://user-images.githubusercontent.com/74055102/174581347-716b2bac-4f44-4452-9b7f-3f0042bda50e.mp4

## Challenges we ran into
The very first challenge we encountered was the repeated failure in pre-processing and fitting of data in TensorFlow Model. With repetitive hits and trials, and sleepless night, we came to our current working algorithm that predicts the user's mood by analyzing the diary entry. Developing machine learning backend took most of our time, making it difficult to complete the app. Another big challenge was the UI development which was also very time-consuming in 24 hours hackathon.

## Accomplishments that we're proud of
Even after a series of hard challenges, we're proud of completing this stamina-focused hackathon. In mere 2 days, we gained a lot of experience competing in our first offline hackathon. While finding alternatives for the failed approaches, we learned a whole lot of new technology that will surely help us in the future.

## What we learned
We learned a great deal about Teamwork, Time Management, Organization Skills, and Taking responsibility. We got to explore amazing workshops and talks organized by Ashoka University, which really helped expand our horizons. We were fortunate enough to meet some amazing people from various universities with some even amazing ideas.

## What's next for ForMente
ForMente is still at its stage zero, but it is still available for and tested for real users. The application would ideally be published on the play store in the future, through which it would be accessible to everyone. Additionally, we aimed to assist people suffering from mental illness, but due to the time limitations, the app right now only points to their emotional state and does nothing about it. The user can still go through their past notes and see what the app was telling them about their emotions. This can help the users grow as a person and feel proud of their achievements. In the future, we don't want to keep this project just as a project, rather we want it as a product for people who are unhappy with their mental health.
