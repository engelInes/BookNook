import 'package:app/models/book.dart';
import 'package:app/models/group.dart';
import 'package:app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CurrentGroup extends ChangeNotifier{
  MyGroup _currentGroup=MyGroup(groupID: '', groupName: '', leader: '', members: [], groupCreated: Timestamp.now(), currentBookID: '', currentBookDue: Timestamp.now());
  MyBook _currentBook=MyBook(bookID: '', bookName: '', length: 0, dateCompleted: Timestamp.now());

  MyGroup get getCurrentGroup => _currentGroup;
  MyBook get getCurrentBook => _currentBook;

  void updateStateFromDatabase(String groupID) async{
    try{
      _currentGroup= await MyDatabase().getGroupData(groupID);
      _currentBook= await MyDatabase().getBookData(groupID, _currentGroup.currentBookID);
      notifyListeners();
    }
    catch(e){
      print(e);
    }
  }
}