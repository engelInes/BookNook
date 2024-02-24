import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier{
  late String _userID;
  late String _userEmail;

  String get getUserID => _userID;
  String get getEmail => _userEmail;

  FirebaseAuth _auth=FirebaseAuth.instance;//creating an authentication instance

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
        _userID=_authRes.user!.uid;
        _userEmail=_authRes.user!.email!;
        hasLoggedIn=true;
      }
    }
    catch(e){print(e);}
    return hasLoggedIn;
  }
}