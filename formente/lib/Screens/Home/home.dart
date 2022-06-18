import 'package:flutter/material.dart';
import 'package:formente/Screens/Home/addDiaryEntry.dart';
import 'package:formente/Screens/Home/showEntries.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowEntries()));
              },
              child: Text("Get user entries"),
          )
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
