import 'package:flutter/material.dart';

class FindHelp extends StatelessWidget {
  const FindHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[const Color(0xff2AB5E1),const Color(0xff19C5FC).withOpacity(0.5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child: const Text(
          "Call on : +91 9999xxxxxx\nEmail Address : xyzhelpline@gmail.com",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
        )
      ),
    );
  }
}
