// ignore_for_file: avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:formente/Models/diaryEntry.dart';
import 'package:formente/Providers/user.dart';
import 'package:formente/Services/user.dart';
import 'package:provider/provider.dart';

import '../../Shared/date_time_picker.dart';

class AddDiaryEntry extends StatefulWidget {
  const AddDiaryEntry({Key? key}) : super(key: key);

  @override
  State<AddDiaryEntry> createState() => _AddDiaryEntryState();
}

class _AddDiaryEntryState extends State<AddDiaryEntry> {
  final DateTime _current = DateTime.now();
  int _year = DateTime.now().year;
  int _month = DateTime.now().month;
  int _day = DateTime.now().day;
  int _hour = DateTime.now().hour;
  int _minute = DateTime.now().minute;
  int _second = DateTime.now().second;


  DiaryEntryModel? entry;
  final _formkey = GlobalKey<FormState>();
  String _entryText = "";
  final UserServices _userServices = UserServices();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors:[const Color(0xff2AB5E1),const Color(0xff19C5FC).withOpacity(0.2)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
          //https://enappd.com/blog/building-a-flutter-datetime-picker/55/
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 20),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.2),
                      filled: true,
                      hintText: 'Enter Diary entry text',
                      border: InputBorder.none,
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                    onChanged: (val){
                      setState((){
                        _entryText = val;
                      });
                    },
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      DatePicker.showDatePicker(context,
                        theme: const DatePickerTheme(
                          containerHeight: 210.0,
                        ),
                        showTitleActions: true,
                        minTime: DateTime(_year-1, 1, 1,0,0,0),
                        maxTime: DateTime(_year, _month, _day,_hour,_minute,_second),
                        onConfirm: (date) {
                          print('confirm $date');
                          _year = date.year;
                          _month = date.month;
                          _day = date.day;
                          setState(() {});
                        },
                        currentTime: DateTime.now(),
                        locale: LocaleType.en,
                      );
                    },
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.calendar_month_rounded
                          ),
                          const SizedBox(width: 20,),
                          Text(
                            "$_day - $_month - $_year"
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      DatePicker.showTimePicker(context,
                          theme: const DatePickerTheme(
                            containerHeight: 210.0,
                          ),
                          showTitleActions: true, onConfirm: (time) {
                            print('confirm $time');
                            _hour = time.hour;
                            _minute = time.minute;
                            _second = time.second;
                            setState(() {});
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                      setState(() {});
                    },
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                              Icons.access_time
                          ),
                          const SizedBox(width: 20,),
                          Text(
                              "$_hour : $_minute : $_second"
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  ElevatedButton(
                      onPressed: ()async{
                        DiaryEntryModel entry = DiaryEntryModel(_entryText, DateTime(_year,_month,_day,_hour,_minute,_second));
                        await userProvider.addToEntries(diaryEntry: entry);
                        print("Added to entries!");
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      child: const Text("Add Entry"),
                  )
                ],
              ),

            ),
          ),
        ),
      ),
    );
  }
}
