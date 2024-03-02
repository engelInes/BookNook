//import 'dart:html';

import 'package:app/screens/addBookScreen/addBookScreen.dart';
//import 'package:app/screens/rootScreen/rootS.dart';
//import 'package:app/services/database.dart';
//import 'package:app/states/currUser.dart';
import 'package:app/widgets/myContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class MyCreateGroup extends StatefulWidget{
  @override
  State<MyCreateGroup> createState() => _MyCreateGroupState();
}

class _MyCreateGroupState extends State<MyCreateGroup>{

  void _goToAddBook(BuildContext context, String groupName) async{
      // CurrentUser _cUser=Provider.of<CurrentUser>(context, listen: false);
      // bool _retString= await MyDatabase().createGroup(groupName, _cUser.getUser.uid, );
      // if(_retString==1){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context)=>MyAddBook(onGroupCreation: true, groupName: groupName),
            ),
        );

  }

  TextEditingController _groupNameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[BackButton()],
              ),
          ),
          Spacer(),
          Padding(
              padding: const EdgeInsets.all(20.0),
                child: MyContainer(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _groupNameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.group),
                          hintText: "Group Name ",
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                          onPressed: ()=> _goToAddBook(context,_groupNameController.text),
                          child:Padding(
                            padding: EdgeInsets.symmetric(horizontal: 100),
                            child: Text(
                              "Create group",
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