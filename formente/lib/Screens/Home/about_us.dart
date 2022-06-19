import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[Color(0xff2AB5E1),Color(0xff19C5FC).withOpacity(0.5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child: Text(
            "Made by Citizenfive\n Akash Rajoria\n Naman Priyadarshi\n Paritosh Chaturvedi\n Pratham Chauhan\n Saransh Chopra",
          style: TextStyle(
              color: Colors.white,
            fontSize: 20
          ),
        ),
      ),
    );
  }
}
