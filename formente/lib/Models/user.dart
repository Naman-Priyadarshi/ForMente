// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

import 'diary_entry.dart';


class UserModel {
  static const ID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";

  static const ENTRIES = "diaryEntries";
  static const NUMBER = 'number';

  static const USERIMAGE = 'userImage';
  static const BIO = 'bio';

  String? _name;
  String? _email;
  String? _id;

  String? _number;

  String? _userImage;
  String? _bio;


//  getters
  String get name => _name!;

  String get email => _email!;

  String get id => _id!;


  String get number => _number!;


  String get userImage => _userImage!;

  String get bio => _bio!;

  //
  List<DiaryEntryModel>? diaryEntries;


  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = (snapshot.data()! as Map<String, dynamic>)[NAME];
    _email = (snapshot.data()! as Map<String, dynamic>)[EMAIL];
    _id = (snapshot.data()! as Map<String, dynamic>)[ID];
    _number = (snapshot.data()! as Map<String, dynamic>)[NUMBER] ?? '';
    _userImage = (snapshot.data()! as Map<String, dynamic>)[USERIMAGE] ?? "";
    _bio = (snapshot.data()! as Map<String, dynamic>)[BIO] ?? "";

    List<DiaryEntryModel> _convertEntries(List diaryEntries) {
      List<DiaryEntryModel> convertedEntries = [];
      for (Map entry in diaryEntries) {
        convertedEntries.add(DiaryEntryModel.fromMap(entry));
      }
      return convertedEntries;
    }

    diaryEntries = _convertEntries((snapshot.data()! as Map<String, dynamic>)[diaryEntries] ?? []);
  }
}
