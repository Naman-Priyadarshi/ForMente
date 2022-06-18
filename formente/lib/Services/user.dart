// ignore_for_file: avoid_print

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:formente/Models/diaryEntry.dart';

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

  void addToEntries({required String uid, required DiaryEntryModel post}){
    _firestore.collection(collection).doc(uid).update({
      "diaryEntries" : FieldValue.arrayUnion([post.toMap()])
    });
    print("debug check post added");
  }
  void removeFromEntries({required String uid, required DiaryEntryModel post}){
    _firestore.collection(collection).doc(uid).update({
      "diaryEntries" : FieldValue.arrayRemove([post.toMap()])
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
    return entries;
  }

}
