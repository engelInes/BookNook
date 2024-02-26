import 'package:app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createUser(MyUser user) async {
    bool newUser = false;
    try {
      await _firestore.collection("users").doc(user.uid).set({
        'fullName': user.fullName,
        'email': user.email,
        'accountCreated': Timestamp.now(),
      });
      newUser = true;
    } catch (e) {
      print(e);
    }
    return newUser;
  }

  Future<MyUser> getUserData(String uid) async {
    MyUser retVal = MyUser(
        uid: "", email: "", fullName: "", accountCreated: Timestamp.now());
    try {
      DocumentSnapshot _docSnap =
          await _firestore.collection("users").doc(uid).get();
      retVal.uid = uid;
      Map<String, dynamic>? userData = _docSnap.data() as Map<String, dynamic>?;
      retVal.fullName = userData?['fullName'];
      retVal.email = userData?['email'];
      retVal.accountCreated = userData?['createdAccount'];
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
