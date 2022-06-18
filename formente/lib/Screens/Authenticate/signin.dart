
import 'package:flutter/material.dart';
import 'package:formente/Screens/Authenticate/reset_password.dart';

import 'package:provider/provider.dart';

import '../../Providers/user.dart';


class SignIn extends StatefulWidget {

  final Function? Toggle;
  SignIn({ this.Toggle});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formkey = GlobalKey<FormState>();

  bool hidePass = true;
  String email = '';
  String password = '';
  String error = '';
  String error2 = '';
  bool _hasbeenpressed = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:[Color(0xff2AB5E1),Color(0xff19C5FC).withOpacity(0.2)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          padding: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 30,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(height: 150,),
                  Image.asset(
                      "assets/logo_big.png",
                    height: 50,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: new BorderRadius.circular(10.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 4.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your Email ID',
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (val) => val==null ? 'Enter a valid email' : null,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: new BorderRadius.circular(10.0)
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      title: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          prefixIcon: Icon(Icons.vpn_key_rounded),
                        ),
                        validator: (val) => val==null || val.length < 6 ? 'Enter a password of more than 6 characters' : null,
                        textAlignVertical: TextAlignVertical.center,
                        obscureText: hidePass,
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
                              _hasbeenpressed =!_hasbeenpressed;
                            });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    child: IconButton(
                        onPressed: ()async{
                          if(_formkey.currentState!.validate()){
                            dynamic result = await user.signIn(email, password);
                            if(result==null){
                              setState(() {
                                error = 'Could not Sign In \n Please supply valid Credentials';
                              });

                            }
                          }
                        },
                        icon: Icon(Icons.arrow_forward_outlined)
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (c)=>ForgotPassword()));
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Text(
                    error,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0
                    ),
                  ),
                  Text(
                    error2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0
                    ),
                  ),
                  SizedBox(height: 70),
                  Text(
                    "Don't have one?"
                  ),
                  ElevatedButton(
                      onPressed: (){
                        widget.Toggle!();
                      },
                      child: Text("Create an account")),
                  SizedBox(height: 40,),
                  Text(
                    "By CitizenFive",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white
                    ),
                  )


                  // ElevatedButton(
                  //     onPressed: ()async{
                  //       if(_formkey.currentState!.validate()){
                  //         dynamic result = await _auth.signInWithGoogle();
                  //         if(result==null){
                  //           setState(() {
                  //             error = 'Could not Sign In \n Please supply valid Credentials';
                  //           });
                  //
                  //         }
                  //       }
                  //     },
                  //     child: Text('Sign in with gugul'))
                ],
              ),

            ),
          ),
        )
    );
  }
}