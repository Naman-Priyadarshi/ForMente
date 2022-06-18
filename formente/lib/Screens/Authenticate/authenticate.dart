import 'package:flutter/material.dart';
import 'package:formente/Screens/Authenticate/signin.dart';
import 'register.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void Toggle() {
    setState(() {
      showSignIn = !showSignIn;
      print(showSignIn);
    });
  }
  @override
  Widget build(BuildContext context) {

    if(showSignIn){
      return SignIn(Toggle: Toggle,);
    }
    else {
      print(showSignIn);
      return Register(Toggle: Toggle,);
    }
  }
}