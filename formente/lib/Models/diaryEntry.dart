import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class DiaryEntryModel{
  var uuid = Uuid();

  static const ID = "id";
  static const ENTRY_TEXT = "entryText";
  static const DATE_TIME = "dateTime";


  String? _id;
  String? _entryText;
  DateTime? _dateTime;

  String get id => _id!;

  String? get entryText => _entryText;

  DateTime? get dateTime => _dateTime;

  DiaryEntryModel(String entryText, DateTime dateTime){
    _id = uuid.v1();
    _entryText = entryText;
    _dateTime = dateTime;
  }

  DiaryEntryModel.fromMap(Map data) {
    _id = data[ID];
    _entryText = data[ENTRY_TEXT];
    _dateTime = data[DATE_TIME];
  }

  Map<String,dynamic> toMap() => {
    ID: _id,
    ENTRY_TEXT: _entryText,
    DATE_TIME: _dateTime,
  };

  DiaryEntryModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = (snapshot.data()! as Map<String, dynamic>)[ID];
    _entryText = (snapshot.data()! as Map<String, dynamic>)[ENTRY_TEXT];
    _dateTime = (snapshot.data()! as Map<String, dynamic>)[DATE_TIME];
  }
}