import 'package:flutter/material.dart';
import 'package:formente/Models/diaryEntry.dart';
import 'package:formente/Providers/user.dart';
import 'package:formente/Services/user.dart';
import 'package:provider/provider.dart';

class AddDiaryEntry extends StatefulWidget {
  const AddDiaryEntry({Key? key}) : super(key: key);

  @override
  State<AddDiaryEntry> createState() => _AddDiaryEntryState();
}

class _AddDiaryEntryState extends State<AddDiaryEntry> {
  DiaryEntryModel? entry;
  final _formkey = GlobalKey<FormState>();
  String _entryText = "";
  DateTime _dateTime = DateTime.now();
  UserServices _userServices = UserServices();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter entry text"
              ),
              onChanged: (val){
                setState((){
                  _entryText = val;
                });
              },
            ),
            ElevatedButton(
                onPressed: ()async{
                  DiaryEntryModel entry = DiaryEntryModel(_entryText, _dateTime);
                  await userProvider.addToEntries(diaryEntry: entry);
                  print("Added to entries!");
                  Navigator.pop(context);
                },
                child: Text("Submit"),
            )
          ],
        ),

      ),
    );
  }
}
