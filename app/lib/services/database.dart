import 'package:app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class MyDatabase{
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  Future<bool> createUser(MyUser user) async{
    bool newUser=false;
    try{
      await _firestore.collection("users").doc(user.uid).set({
        'fullName': user.fullName,
        'email':user.email,
        'accountCreated':Timestamp.now(),
      });
    }catch(e){print(e);}
    return newUser;
  }
}