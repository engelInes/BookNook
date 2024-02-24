import 'package:app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier{
  MyUser _currUser=MyUser(uid: '', email: '', fullName: '', accountCreated: Timestamp.now());
  //late String _userID;
  //late String _userEmail;

  // String get getUserID => _userID;
  // String get getEmail => _userEmail;
  MyUser get getUser => _currUser;

  FirebaseAuth _auth=FirebaseAuth.instance;//creating an authentication instance

  Future<bool> onStartUp() async{
    bool hasStarted=false;
    try{
        //The ? in User? indicates that the value may be null,
      // so ensuring that user is defined resolves the issue
      User? _firebaseUser= await _auth.currentUser;
      _currUser.uid=_firebaseUser!.uid;
      _currUser.email=_firebaseUser.email!;
      // _userID=_firebaseUser!.uid;
      // _userEmail=_firebaseUser.email!;
      hasStarted=true;
    }
    catch(e){print(e);}
    return hasStarted;
  }

  Future<bool> onSignOut() async{
    bool hasStarted=false;
    try{
      //The ? in User? indicates that the value may be null,
      // so ensuring that user is defined resolves the issue
      await _auth.signOut();
      // _userID="";
      // _userEmail="";
      // _currUser="" as MyUser;
      _currUser=MyUser(uid: '', email: '', fullName: '', accountCreated: Timestamp.now());
      hasStarted=true;
    }
    catch(e){print(e);}
    return hasStarted;
  }

  Future<bool> signUpUser(String email, String psswd)async{
    bool hasSignedIn=false;
    try{
      UserCredential _authRes= await _auth.createUserWithEmailAndPassword(email: email, password: psswd);
      if(_authRes.user != null){
        hasSignedIn=true;
      }
    }
    catch(e){print(e);}
    return hasSignedIn;
  }

  Future<bool> logInUser(String email, String psswd)async{

    bool hasLoggedIn=false;

    try{
      UserCredential _authRes=await _auth.signInWithEmailAndPassword(email: email, password: psswd);
      if(_authRes.user!=null){
        _currUser.uid=_authRes.user!.uid;
        _currUser.email=_authRes.user!.email!;
        hasLoggedIn=true;
      }
    }
    catch(e){print(e);}
    return hasLoggedIn;
  }
}