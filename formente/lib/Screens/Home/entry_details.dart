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
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[const Color(0xff2AB5E1),const Color(0xff19C5FC).withOpacity(0.5)],
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
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
                Text(
                  widget.formattedTime,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                )
              ],
            ),
            const SizedBox(height: 40,),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color:const Color(0xff2AB5E1).withOpacity(0.5)),
                  color: Colors.white.withOpacity(0.6)
                ),
                child: Text(
                  "${widget.entryText}",
                  style: const TextStyle(
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
