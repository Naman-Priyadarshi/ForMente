import 'package:flutter/material.dart';

class FindHelp extends StatelessWidget {
  const FindHelp({Key? key}) : super(key: key);

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
          "Call on : +91  9999666555\nEmail Address :  help@vandrevalafoundation.com",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
        )
      ),
    );
  }
}
