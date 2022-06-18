import 'package:flutter/material.dart';

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
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[Color(0xff2AB5E1),Color(0xff19C5FC).withOpacity(0.2)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    widget.formattedDate,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Text(
                  widget.formattedTime,
                  style: TextStyle(
                    fontSize: 20
                  ),
                )
              ],
            ),
            SizedBox(height: 40,),
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color:Color(0xff2AB5E1).withOpacity(0.5)),
                  color: Colors.white.withOpacity(0.6)
                ),
                child: Text(
                  "${widget.entryText}",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
