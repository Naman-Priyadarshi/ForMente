// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:formente/Screens/Authenticate/signin.dart';
import 'register.dart';
class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  // ignore: non_constant_identifier_names
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