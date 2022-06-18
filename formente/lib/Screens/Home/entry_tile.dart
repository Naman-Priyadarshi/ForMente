import 'package:flutter/material.dart';
import 'package:formente/Models/diary_entry.dart';

class DiaryEntryTile extends StatefulWidget {
  final DiaryEntryModel entry;
  const DiaryEntryTile({Key? key, required this.entry}) : super(key: key);

  @override
  State<DiaryEntryTile> createState() => _DiaryEntryTileState();
}

class _DiaryEntryTileState extends State<DiaryEntryTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        title: Text("${widget.entry.dateTime}"),
        subtitle: Text("${widget.entry.entryText}"),
      ),
    );
  }
}
