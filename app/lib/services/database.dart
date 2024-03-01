import 'package:app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/models/group.dart';

import '../models/book.dart';

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
        uid: "", email: "", fullName: "", accountCreated: Timestamp.now(), groupID: "");
    try {
      DocumentSnapshot _docSnap =
          await _firestore.collection("users").doc(uid).get();
      retVal.uid = uid;
      Map<String, dynamic>? userData = _docSnap.data() as Map<String, dynamic>?;
      retVal.fullName = userData?['fullName'];
      retVal.email = userData?['email'];
      retVal.accountCreated = userData?['createdAccount'];
      retVal.groupID= userData?['groupId'];
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<MyGroup> getGroupData(String groupID) async {
    MyGroup retVal = MyGroup(groupID: '', groupName: '', leader: '', members: [], groupCreated: Timestamp.now(), currentBookID: '', currentBookDue: Timestamp.now());
    try {
      DocumentSnapshot _docSnap =
      await _firestore.collection("groups").doc(groupID).get();
      retVal.groupID = _docSnap.id;
      Map<String, dynamic>? groupData = _docSnap.data() as Map<String, dynamic>?;
      retVal.groupName = groupData?['name'];
      retVal.leader = groupData?['leader'];
      retVal.members = groupData?['members'];
      retVal.groupCreated= groupData?['groupCreated'];
      retVal.currentBookID= groupData?['currentBookID'];
      retVal.currentBookDue= groupData?['currentBookDue'];
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<MyBook> getBookData(String groupID, String bookID) async {
    MyBook retVal = MyBook(bookID: '', bookName: '', length: 0, dateCompleted: Timestamp.now());
    try {
      DocumentSnapshot _docSnap =
      await _firestore.collection("groups").doc(groupID).collection("books").doc(bookID).get();
      retVal.bookID = _docSnap.id;
      Map<String, dynamic>? groupData = _docSnap.data() as Map<String, dynamic>?;
      retVal.bookName = groupData?['name'];
      retVal.length = groupData?['length'];
      retVal.dateCompleted = groupData?['dateCompleted'];
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<bool> createGroup(String groupName, String userID) async {
    bool newGroup = false;
    List<String> members= [];
    try {
      members.add(userID);
      DocumentReference _docRef= await _firestore.collection("groups").add(
        {
          'name' : groupName,
          'leader' : userID,
          'members' : members,
          'groupCreated' : Timestamp.now(),
        }
      );
      await _firestore.collection("users").doc(userID).update({
        'groupID' : _docRef.id,
      });
      newGroup = true;
    } catch (e) {
      print(e);
    }
    return newGroup;
  }

  Future<bool> joinGroup(String groupID, String userID) async {
    bool newGroup = false;
    List<String> members= [];
    try {
      members.add(userID);
      await _firestore.collection("groups").doc(groupID).update({
        'members': FieldValue.arrayUnion(members),
      });
      await _firestore.collection("users").doc(userID).update({
        'groupID': groupID,
      });
      newGroup = true;
    } catch (e) {
      print(e);
    }
    return newGroup;
  }
}
