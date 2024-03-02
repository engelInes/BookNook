import 'package:app/models/book.dart';
import 'package:app/screens/rootScreen/rootS.dart';
import 'package:app/services/database.dart';
import 'package:app/states/currUser.dart';
import 'package:app/widgets/myContainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as dt_picker;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class MyAddBook extends StatefulWidget{
  final bool onGroupCreation;
  final String groupName;

  MyAddBook({
    required this.onGroupCreation,
    required this.groupName,
  });
  @override
  _MyAddBookState createState() => _MyAddBookState();
}

class _MyAddBookState extends State<MyAddBook>{

  void addBook(BuildContext context, String groupName, MyBook book) async{
    CurrentUser _cUser=Provider.of<CurrentUser>(context, listen: false);
    bool _retString= await MyDatabase().createGroup(groupName, _cUser.getUser.uid, book);

    if(widget.onGroupCreation){
      _retString=await MyDatabase().createGroup(groupName, _cUser.getUser.uid, book);
    }
    else{
      _retString= await MyDatabase().addBook(_cUser.getUser.groupID, book);
    }

    if(_retString==1){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context)=>MyRoot(),
          ),
              (route) => false);
    }
  }

  TextEditingController _bookNameController=TextEditingController();
  TextEditingController _bookAuthorController=TextEditingController();
  TextEditingController _bookLengthController=TextEditingController();

  DateTime _selectedDate= DateTime.now();

  Future<void>_selectDate(BuildContext context)async{
    final DateTime? picked= await dt_picker.DatePicker.showDatePicker(context, showTitleActions: true);
    if(picked!= null && picked!= _selectedDate){
      setState(() {
        _selectedDate=picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[BackButton()],
            ),
          ),
          //Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyContainer(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _bookNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.book),
                      hintText: "Book Name ",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _bookAuthorController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Author ",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _bookLengthController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.photo_size_select_small_outlined),
                      hintText: "Book Length ",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(DateFormat.yMMMMd("en_US").format(_selectedDate)),
                  Text(DateFormat("H:mm").format(_selectedDate)),
                  TextButton(
                      onPressed: ()=>_selectDate(context), child: Text("Change Date"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      MyBook book=MyBook(bookID: '', bookName: '', author: '', length: 0, dateCompleted: Timestamp.now());
                      book.bookName=_bookNameController.text;
                      book.author=_bookAuthorController.text;
                      book.length=int.parse(_bookLengthController.text);
                      book.dateCompleted=Timestamp.fromDate(_selectedDate);

                      addBook(context, widget.groupName, book);
                    },
                    child:Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Text(
                        "Add Book",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}