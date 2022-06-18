import 'package:flutter/material.dart';
import 'dart:async';

import 'package:formente/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreeState();
}

class _SplashScreeState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                ScreensController()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Image(image: AssetImage("assets/background.png"))
        ],
      ),
    );
  }
}