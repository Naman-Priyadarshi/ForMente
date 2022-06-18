import 'package:flutter/material.dart';
import 'package:formente/Models/diaryEntry.dart';

class EntryDetails extends StatefulWidget {
  final String formattedDate;
  final String formattedTime;
  final String? entryText;
  const EntryDetails({Key? key,required this.formattedDate,required this.formattedTime,required this.entryText, }) : super(key: key);

  @override
  State<EntryDetails> createState() => _EntryDetailsState();
}

class _EntryDetailsState extends State<EntryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        child: Column(
          children: [
            Container(
              child: Text(
                "${widget.formattedDate}\n${widget.formattedTime}"
              ),
            ),
            SizedBox(height: 40,),
            SingleChildScrollView(
              child: Container(
                child: Text(
                  "${widget.entryText}"
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
