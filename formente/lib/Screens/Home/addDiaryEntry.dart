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
  DateTime _current = DateTime.now();
  int _year = DateTime.now().year;
  int _month = DateTime.now().month;
  int _day = DateTime.now().day;
  int _hour = DateTime.now().hour;
  int _minute = DateTime.now().minute;
  int _second = DateTime.now().second;


  DiaryEntryModel? entry;
  final _formkey = GlobalKey<FormState>();
  String _entryText = "";
  UserServices _userServices = UserServices();

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
                  colors:[Color(0xff2AB5E1),Color(0xff19C5FC).withOpacity(0.2)],
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
                      focusedBorder: OutlineInputBorder(
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
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      DatePicker.showDatePicker(context,
                        theme: DatePickerTheme(
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
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month_rounded
                          ),
                          SizedBox(width: 20,),
                          Text(
                            "${_day} - ${_month} - ${_year}"
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      DatePicker.showTimePicker(context,
                          theme: DatePickerTheme(
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
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              Icons.access_time
                          ),
                          SizedBox(width: 20,),
                          Text(
                              "${_hour} : ${_minute} : ${_second}"
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                      onPressed: ()async{
                        DiaryEntryModel entry = DiaryEntryModel(_entryText, DateTime(_year,_month,_day,_hour,_minute,_second));
                        await userProvider.addToEntries(diaryEntry: entry);
                        print("Added to entries!");
                        Navigator.pop(context);
                      },
                      child: Text("Add Entry"),
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
