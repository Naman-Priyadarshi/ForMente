// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/user.dart';

class Register extends StatefulWidget {
  final Function Toggle;
  const Register({required this.Toggle});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  String name = '';
  bool _hasbeenpressed = false;
  bool hidePass = true;
  String message = 'An account confirmation email has just been sent to your email';
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
        body:Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors:[const Color(0xff2AB5E1),const Color(0xff19C5FC).withOpacity(0.5)
],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    )
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      const SizedBox(height: 100,),
                      Image.asset(
                        "assets/logo_big.png",
                        height: 50,
                      ),

                      const SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your Name',
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                            prefixIcon: Icon(Icons.person),
                          ),
                          onChanged: (val) {
                            setState(() {
                              name = val;
                            });
                          } ,
                          validator: (val) =>
                          val==null ? 'Enter a name' : null,
                          textAlignVertical: TextAlignVertical.center,
                        ),

                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your Email ID',
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                            prefixIcon: Icon(Icons.email),
                          ),
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          } ,
                          validator: (val) =>
                          val==null ? 'Enter an email' : null,
                          textAlignVertical: TextAlignVertical.center,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          title: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter your password',
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.blue)),
                              prefixIcon: Icon(Icons.vpn_key_rounded),
                            ),
                            validator: (val) => val==null || val.length  < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            textAlignVertical: TextAlignVertical.center,
                            obscureText: hidePass,
                            // net ninja
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                          trailing: IconButton(
                            focusColor: Colors.red,
                            icon: Icon(Icons.remove_red_eye,
                              color: _hasbeenpressed? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                hidePass = !hidePass;
                                _hasbeenpressed = !_hasbeenpressed;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Confirm your password',
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.blue)),
                              prefixIcon: Icon(Icons.vpn_key_sharp),
                            ),
                            validator: (val) => val == password ? null : 'Passwords not matching',
                            textAlignVertical: TextAlignVertical.center,
                            obscureText: true,
                          )
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white30,
                          elevation: 0.5,
                        ),
                        onPressed: ()async{
                          if(_formkey.currentState!.validate()){
                            dynamic result = await user.signUp(name, email, password);
                            if(result==null){
                              setState(() {
                                message = 'Could not Register \n Please supply a valid email';
                              });
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                            // ignore: use_build_context_synchronously
                          }
                        },
                        child: const Text(
                          'Join ForMente!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                          ),
                        ),

                      ),
                      const SizedBox(height: 40,),
                      GestureDetector(
                        onTap:() {
                          widget.Toggle();
                          },
                        child: const Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      const Text(
                        "By CitizenFive",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.white
                        ),
                      )                      // Text(
                      //   error,
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     color: Colors.red,
                      //     fontSize: 20.0
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}

