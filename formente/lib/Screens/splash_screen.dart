import 'package:flutter/material.dart';
import 'dart:async';

import 'package:formente/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreeState();
}

class _SplashScreeState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                const ScreensController()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Image.asset(
    "assets/splash.png",fit: BoxFit.fill,scale: 1.2 ,
    );
  }
}