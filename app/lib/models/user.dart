import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser{
  String uid;
  String email;
  String fullName;
  Timestamp accountCreated;

  MyUser({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.accountCreated,
});
}