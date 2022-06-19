import 'package:flutter/material.dart';
import 'package:formente/Models/diary_entry.dart';

import 'entry_details.dart';


class DiaryEntryTile extends StatefulWidget {
  final DiaryEntryModel entry;
  const DiaryEntryTile({Key? key, required this.entry}) : super(key: key);

  @override
  State<DiaryEntryTile> createState() => _DiaryEntryTileState();
}

class _DiaryEntryTileState extends State<DiaryEntryTile> {
  Map<int,String> monthMap = {
    1 : 'January',
    2 : 'February',
    3 : 'March',
    4 : 'April',
    5 : 'May',
    6 : 'June',
    7 : 'July',
    8 : 'August',
    9 : 'September',
    10 : 'October',
    11 : 'November',
    12 : 'December'
  };
  List isDay = ['AM','PM'];

  @override
  Widget build(BuildContext context) {
    String formattedDate = "${widget.entry.dateTime?.day}, ${monthMap[widget.entry.dateTime?.month]} ${widget.entry.dateTime?.year}";
    String formattedTime = "${widget.entry.dateTime!.hour%12} : ${widget.entry.dateTime?.minute} ${isDay[widget.entry.dateTime!.hour~/12]}";
    String? emotion = widget.entry.emotion;

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>EntryDetails(formattedDate: formattedDate,formattedTime: formattedTime,entryText: widget.entry.entryText,emotion: emotion,)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue.withOpacity(0.5))
        ),
        child: ListTile(
          title: Text(
              "$formattedDate\n$formattedTime"
          ),
          subtitle: Text(
              widget.entry.entryText!.length>10? "${ widget.entry.entryText!.substring(0,10)}... " : "${widget.entry.entryText}\nEmotion felt : $emotion"
          ),
        ),
      ),
    );
  }
}
