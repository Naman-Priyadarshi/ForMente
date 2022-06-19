// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class DiaryEntryModel {
  var uuid = const Uuid();

  static const ID = "id";
  static const ENTRY_TEXT = "entryText";
  static const DATE_TIME = "dateTime";
  static const EMOTION = "emotion";

  String? _id;
  String? _entryText;
  DateTime? _dateTime;
  String? _emotion;

  String get id => _id!;

  String? get entryText => _entryText;

  DateTime? get dateTime => _dateTime;

  String? get emotion => _emotion;

  DiaryEntryModel(String entryText, DateTime dateTime, String emotion){

    _id = uuid.v1();
    _entryText = entryText;
    _dateTime = dateTime;
    _emotion = emotion;
  }

  DiaryEntryModel.fromMap(Map data) {
    _id = data[ID];
    _entryText = data[ENTRY_TEXT];
    _dateTime = DateTime.fromMicrosecondsSinceEpoch(
        data[DATE_TIME].microsecondsSinceEpoch);
    _emotion = data[EMOTION];
  }

  Map<String, dynamic> toMap() => {
        ID: _id,
        ENTRY_TEXT: _entryText,
        DATE_TIME: _dateTime,
        EMOTION: _emotion,
      };

  DiaryEntryModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = (snapshot.data()! as Map<String, dynamic>)[ID];
    _entryText = (snapshot.data()! as Map<String, dynamic>)[ENTRY_TEXT];
    _dateTime = (snapshot.data()! as Map<String, dynamic>)[DATE_TIME];
    _emotion = (snapshot.data()! as Map<String, dynamic>)[EMOTION];
  }
}
