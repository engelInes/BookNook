import 'package:app/models/user.dart';
import 'package:app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier {
  MyUser _currUser =
      MyUser(uid: '', email: '', fullName: '', accountCreated: Timestamp.now(), groupID: '');

  //late String _userID;
  //late String _userEmail;

  // String get getUserID => _userID;
  // String get getEmail => _userEmail;
  MyUser get getUser => _currUser;

  FirebaseAuth _auth =
      FirebaseAuth.instance; //creating an authentication instance

  Future<bool> onStartUp() async {
    bool hasStarted = false;
    try {
      //The ? in User? indicates that the value may be null,
      // so ensuring that user is defined resolves the issue
      User? _firebaseUser = await _auth.currentUser;
      if (_firebaseUser != null) {
        _currUser = await MyDatabase().getUserData(_firebaseUser.uid);
        if (_currUser != null) {
          hasStarted = true;
        }
      }
      // _userID=_firebaseUser!.uid;
      // _userEmail=_firebaseUser.email!;
    } catch (e) {
      print(e);
    }
    return hasStarted;
  }

  Future<bool> onSignOut() async {
    bool hasStarted = false;
    try {
      //The ? in User? indicates that the value may be null,
      // so ensuring that user is defined resolves the issue
      await _auth.signOut();
      // _userID="";
      // _userEmail="";
      // _currUser="" as MyUser;
      _currUser = MyUser(
          uid: '', email: '', fullName: '', accountCreated: Timestamp.now(), groupID: '');
      hasStarted = true;
    } catch (e) {
      print(e);
    }
    return hasStarted;
  }

  Future<bool> signUpUser(String email, String psswd, String fullName) async {
    bool hasSignedIn = false;
    MyUser _user = MyUser(
        uid: '', email: '', fullName: '', accountCreated: Timestamp.now(), groupID: '');
    try {
      UserCredential _authRes = await _auth.createUserWithEmailAndPassword(
          email: email, password: psswd);
      _user.uid = _authRes.user as String;
      _user.email = _authRes.user!.email!;
      _user.fullName = fullName;
      bool _isSuccessful = await MyDatabase().createUser(_user);
      if (_isSuccessful == true) {
        hasSignedIn = true;
      }
      // if(_authRes.user != null){
      //   hasSignedIn=true;
      // }
    } catch (e) {
      print(e);
    }
    return hasSignedIn;
  }

  Future<bool> logInUser(String email, String psswd) async {
    bool hasLoggedIn = false;

    try {
      UserCredential _authRes =
          await _auth.signInWithEmailAndPassword(email: email, password: psswd);
      _currUser = await MyDatabase().getUserData(_authRes.user!.uid);
      // if(_authRes.user!=null){
      //   _currUser.uid=_authRes.user!.uid;
      //   _currUser.email=_authRes.user!.email!;
      //   hasLoggedIn=true;
      // }
      if (_currUser != null) {
        hasLoggedIn = true;
      }
    } catch (e) {
      print(e);
    }
    return hasLoggedIn;
  }
}
