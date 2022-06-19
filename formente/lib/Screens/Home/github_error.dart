import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Giterror extends StatelessWidget {
  const Giterror({Key? key}) : super(key: key);

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
          child: GestureDetector(
            onTap: ()=>launchUrl(Uri.parse('https://github.com/redbrickhacks/redbrickhacks-2022-submission-citizenfive/issues/new')),
            child: Text(
                " Issues with Project? ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
            ),
          ),
          // child: Text(
          //   "Submit new error here:\nhttps://github.com/redbrickhacks/redbrickhacks-2022-submission-citizenfive/issues/new",
          //   style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 20
          //   ),
          // )
      ),
    );
  }
}