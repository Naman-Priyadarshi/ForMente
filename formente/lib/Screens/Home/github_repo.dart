import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GitLink extends StatelessWidget {
  const GitLink({Key? key}) : super(key: key);

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
          child: GestureDetector(
            onTap: ()=>launchUrl(Uri.parse('https://github.com/redbrickhacks/redbrickhacks-2022-submission-citizenfive')),
            child: const Text(
                " GitHub Repo! ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
            ),
          ),
          // child: Text(
          //   "Link:\nhttps://github.com/redbrickhacks/redbrickhacks-2022-submission-citizenfive",
          //   style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 20
          //   ),
          // )
      ),
    );
  }
}
