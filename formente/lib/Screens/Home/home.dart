import 'package:flutter/material.dart';
import 'package:formente/Providers/user.dart';
import 'package:formente/Screens/Home/addDiaryEntry.dart';
import 'package:formente/Screens/Home/showEntries.dart';
import 'package:provider/provider.dart';

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
          SizedBox(height: 50,),
          ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowEntries()));
              },
              child: Text("Get user entries"),
          ),
          SizedBox(height: 50,),
          ElevatedButton(
              onPressed: ()async{
                await userProvider.signOut();
              },
              child: Text("Sign Out"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDiaryEntry()));
        },
      ),
    );
  }
}
