# ForMente by CitizenFive

<p align="center">

  <img src="https://user-images.githubusercontent.com/77211855/174463614-67e3461b-6351-4307-be7a-10e1465b7e64.png" height=400/>
</p>
 
![Screens1](https://user-images.githubusercontent.com/74055102/174467290-9d5d125d-165c-45ff-9e5e-243d85bd16d5.png)
![Screens2](https://user-images.githubusercontent.com/74055102/174467292-c9985e47-b3d6-4fb9-988b-7c0c6951ea13.png)

## Inspiration
The first person that someone usually talks to about their mental health is themselves. This buries the person with self-doubt that becomes hard to cure. ForMente comes in between to diagnose a person's feelings through Natural Language Processing. It is a personal diary application that lets a user know how their daily emotions feel, through the text they note down in it.

## What it does
ForMente is a personal diary that allows users to write down their minds every day. These texts are stored securely in our database, and users can visit them whenever they want. The main aim of ForMente is to let the user know how they are feeling and that they are not overthinking it. To achieve this, the application runs natural language processing on the texts written by a user and shows them how they are feeling in real-time. All the data provided by a user is never accessed by anyone else and is secured safely in a database.

## How we built it
We built the application in 3 broad parts -

- The application The application has been built using Flutter and Dart and is available on all Android devices. The UI has been taken utmost care of and is as smooth as it could be. This application is available through GitHub for everyone in the world.

- The model The application uses a model to classify what a user is feeling. This is a Natural Language Processing model, and it was trained using scikit-learn and python. We started by training an LSTM neural network, but after spending around 12 hours on it, we couldn't get it to run on an Android device, due to the technical limitations. After this, we decided to switch to a lighter model, which could be deployed on the free dynos available at Heroku, and we succeeded!

- The backend The backend serves as a holder for our model. This was written using Python and FastAPI, and it has been deployed on Heroku. The backend API is completely free, independent of the other parts of the project, and easily accessible; hence, developers can use the backend API as a standalone product. The API takes in the text provided by an application and returns an emotion strongly correlated with the text.


## RedBrick Hacks 2022 Submission Repository

- Hacking starts at 11:00am (IST) on June 18th 2022
- Hacking ends at sharp **11:00am (IST) on June 19th 2022**
    - Late submissions will not be allowed (by us or the system)
- DevPost Link will be provided later, that is the final submission portal - this includes your entire project, this repository directory, and a 3-minute recorded video demo of your project
- **Your commit history in this repository will be taken into account during plagiarism check after submission.**
    - Commit often
    - Every commit counts, even the smallest ones
    - Good commit messages are always appreciated 
- [The RedBrick Hacks Code of Conduct](https://min.gitcdn.link/cdn/redbrickhacks/redbrickhacks.github.io/redirect_patch/policies.pdf)

## Theme: Tech4SocialGood
> "The best way to predict the future is to invent it." - Alan Kay

What's the year 2048 going to look like? What new problems will arise? The theme challenges participants to predict the problems of the future and come up with novel solutions. Hosted at a Liberal Arts University, we believe in an interdisciplinary approach to solve practical and socially relevant problems. 

| Tracks 	|  	| Description 	|
|:---:	|:---:	|---	|
| Health and Wellness 	| ![Health and Wellness](https://i.ibb.co/Y38Wgmh/Health-Light-Text-Light-Logo-2x.png) 	| How can you use technical innovation to address modern public health challenges like a pandemic, mental health, nutrition, fitness, etc? 	|
| Sustainable Growth 	| ![Sustainable Growth](https://i.ibb.co/ySzkfzP/Sustainability-Light-Text-Light-Logo-2x.png) 	| How can you use technology to improve environmental sustainability? What social, cultural, political or economic measures can be taken to empower voices of underrepresented groups and how can tech make a difference in the role they play? 	|
| Security and Privacy 	| ![Security and Privacy](https://i.ibb.co/7gfBd9s/Security-Light-Text-Light-Logo-2x.png) 	| What security challenges do we face in modern online and offline world with the permeance of technology into every aspect of life? How will you solve them in accessible ways? 	|

## HAPPY HACKING!
