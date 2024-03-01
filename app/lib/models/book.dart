import 'package:cloud_firestore/cloud_firestore.dart';

class MyBook{
  String bookID;
  String bookName;
  int length;
  Timestamp dateCompleted;

  MyBook({
    required this.bookID,
    required this.bookName,
    required this.length,
    required this.dateCompleted,
  });
}
