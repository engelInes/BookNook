import 'package:cloud_firestore/cloud_firestore.dart';

class MyGroup{
  String groupID;
  String groupName;
  String leader;
  List<String> members;
  Timestamp groupCreated;

  MyGroup({
    required this.groupID,
    required this.groupName,
    required this.leader,
    required this.members,
    required this.groupCreated,
});
}