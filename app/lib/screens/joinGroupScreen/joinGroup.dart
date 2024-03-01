import 'package:app/widgets/myContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/database.dart';
import '../../states/currUser.dart';
import '../rootScreen/rootS.dart';

class MyJoinGroup extends StatefulWidget{
  @override
  State<MyJoinGroup> createState() => _MyJoinGroupState();
}

class _MyJoinGroupState extends State<MyJoinGroup>{

  void _joinGroup(BuildContext context, String groupID) async{
    CurrentUser _cUser=Provider.of<CurrentUser>(context, listen: false);
    bool _retString= await MyDatabase().joinGroup(groupID, _cUser.getUser.uid);
    if(_retString==1){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context)=>MyRoot()
          ),
              (route) => false);
    }
  }
  TextEditingController _groupIDController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[BackButton(

              )],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyContainer(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _groupIDController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.group),
                      hintText: "Group ID ",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: ()=>_joinGroup(context, _groupIDController.text),
                    child:Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Text(
                        "Join group",
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