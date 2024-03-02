import 'package:cloud_firestore/cloud_firestore.dart';

class MyBook{
  String bookID;
  String bookName;
  String author;
  int length;
  Timestamp dateCompleted;

  MyBook({
    required this.bookID,
    required this.bookName,
    required this.author,
    required this.length,
    required this.dateCompleted,
  });
}
