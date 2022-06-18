import 'package:flutter/material.dart';
import 'package:formente/Screens/Authenticate/signin.dart';
import 'package:provider/provider.dart';

import '../../Providers/user.dart';

class ForgotPassword extends StatefulWidget {
  static String id = 'forgot-password';

  const ForgotPassword({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();


  late String email;

  String message= '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17,

        ),
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),

    );
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Your Email',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                TextFormField(
                  onChanged: (val){
                    email = val;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    icon: Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                    errorStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Send Email'),
                  onPressed: () async{
                    // ignore: prefer_adjacent_string_concatenation
                    if(email.contains("@"+".") ){
                      await user.passwordReset(email);
                      setState(() {
                        message = 'A reset password link has just been sent to your email';
                      });
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    else{
                      setState(() {
                        message = 'Please provide a valid email';
                      });
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }

                    // Navigator.push(context, MaterialPageRoute(builder: (c)=>ConfirmEmail(message: message,)));

                  },
                ),
                TextButton(
                  child: const Text('Sign In'),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (c)=>const SignIn()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}