// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formente/Models/diary_entry.dart';
import 'package:formente/Models/user.dart';

import '../Services/user.dart';

// ignore: constant_identifier_names
enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  final FirebaseAuth _auth;
  User? _user;
  Status _status = Status.Uninitialized;
  final UserServices _userServices = UserServices();

  UserModel? _userModel;

  UserModel get userModel => _userModel!;

  Status get status => _status;

  User get user => _user!;

  List<DiaryEntryModel> diaryEntries = [];

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onStateChanged);
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        _userModel = await _userServices.getUserById(value.user!.uid);
        notifyListeners();
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp(String name, String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        print("CREATE USER");
        await _userServices.createUser({
          'name': name,
          'email': email,
          'uid': user.user!.uid,
          'number': '',
          'bio': '',
          'userImage': '',
          'diaryEntries' : []
        });
        _userModel = await _userServices.getUserById(user.user!.uid);
        notifyListeners();
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> updateUser(String name, String email, String number, String bio) async {
    try {
      print("CREATE USER");
      await _userServices.createUser({
        'name': name,
        'email': email,
        'uid': user.uid,
        'number': number,
        'bio': bio,
        'userImage': '',
      });
      _userModel = await _userServices.getUserById(user.uid);
      notifyListeners();

      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<bool> passwordReset(String email) async {
  try {
    _status = Status.Authenticating;
    notifyListeners();
    await _auth.sendPasswordResetEmail(email: email);
    notifyListeners();
    return true;
  }
  catch (e) {
    _status = Status.Unauthenticated;
    notifyListeners();
    print(e.toString());
    return false;
  }


}

  Future<void> _onStateChanged(User? user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _userModel = await _userServices.getUserById(user.uid);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  Future<bool> addToEntries({required DiaryEntryModel diaryEntry})async{
    try{
      String uid = user.uid;
      _userServices.addToEntries(uid: uid, diaryEntry: diaryEntry);
      return true;
    }catch(e){
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }
  Future<bool> removeFromEntries({required DiaryEntryModel diaryEntry})async{
    try{
      String uid = user.uid;
      _userServices.removeFromEntries(uid: uid, diaryEntry: diaryEntry);
      return true;
    }catch(e){
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<List<DiaryEntryModel>> getEntries()async{
    try{
      String uid = user.uid;
      return await _userServices.getEntries(uid: uid);
    }catch(e){
      print("THE ERROR ${e.toString()}");
      return [];
    }
  }


}
