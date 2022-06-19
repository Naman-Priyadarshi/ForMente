import 'package:flutter/material.dart';
import 'package:formente/Providers/user.dart';
import 'package:formente/Screens/Home/add_diary_entry.dart';
import 'package:formente/Screens/Home/show_entries.dart';
import 'package:provider/provider.dart';

import 'dashboard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Dashboard(),
          // const SizedBox(height: 50,),
          // ElevatedButton(
          //     onPressed: (){
          //       Navigator.push(context, MaterialPageRoute(builder: (context)=>const ShowEntries()));
          //     },
          //     child: const Text("Get user entries"),
          // ),
          // const SizedBox(height: 50,),
          // ElevatedButton(
          //     onPressed: ()async{
          //       await userProvider.signOut();
          //     },
          //     child: const Text("Sign Out")
          // ),
          // ElevatedButton(
          //     onPressed: (){
          //       Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddDiaryEntry()));
          //     },
          //     child: const Text("Add new entry")
          // ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddDiaryEntry()));
        },
      ),
    );
  }
}
