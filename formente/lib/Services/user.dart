// ignore_for_file: avoid_print

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:formente/Models/diary_entry.dart';

import '../Models/user.dart';

class UserServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "users";

  createUser(Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(data["uid"]).set(data);
      print("USER WAS CREATED");
      return true;
    } catch (e) {
      print('ERROR: ${e.toString()}');
    }
  }

  updateUser(Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(data["uid"]).set(data);
      print("USER WAS CREATED");
      return true;
    } catch (e) {
      print('ERROR: ${e.toString()}');
    }
  }

  Future<UserModel> getUserById(String id) =>
      _firestore.collection(collection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });

  void addToEntries({required String uid, required DiaryEntryModel diaryEntry}){
    _firestore.collection(collection).doc(uid).update({
      "diaryEntries" : FieldValue.arrayUnion([diaryEntry.toMap()])
    });
  }
  void removeFromEntries({required String uid, required DiaryEntryModel diaryEntry}){
    _firestore.collection(collection).doc(uid).update({
      "diaryEntries" : FieldValue.arrayRemove([diaryEntry.toMap()])
    });
  }
  Future<List<DiaryEntryModel>> getEntries({required String uid})async{
    var snapshot = await _firestore.collection(collection).doc(uid).get();
    Map<String,dynamic> data = snapshot.data()!;
    List<dynamic> entriesData = data['diaryEntries'];
    List<DiaryEntryModel> entries = [];
    for (var entry in entriesData) {
      DiaryEntryModel element = DiaryEntryModel.fromMap(entry);
      entries.add(element);
    }
    entries.sort((a,b)=>b.dateTime!.compareTo(a.dateTime!));
    return entries;
  }

}
