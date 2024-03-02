import 'dart:async';

import 'package:app/screens/addBookScreen/addBookScreen.dart';
import 'package:app/screens/noGroupScreen/noGroup.dart';
import 'package:app/screens/rootScreen/rootS.dart';
import 'package:app/states/currGroup.dart';
import 'package:app/states/currUser.dart';
import 'package:app/utils/counter.dart';
import 'package:app/widgets/myContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> _timeUntilNextBook=List.filled(2, "");//add growable: true if necc
  //[0] time until book is due
  //[1] time until next book is revealed

  late Timer _timer;
  void startTimer(CurrentGroup currentGroup){
    _timer=Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timeUntilNextBook=MyCounter().timeLeft(currentGroup.getCurrentGroup.currentBookDue.toDate());
      });
    });
  }
  @override
  void initState(){
    super.initState();
    CurrentUser _currUser=Provider.of<CurrentUser>(context, listen: false);
    CurrentGroup _currGroup=Provider.of<CurrentGroup>(context, listen: false);
    _currGroup.updateStateFromDatabase(_currUser.getUser.groupID);
    startTimer(_currGroup);
  }

  @override
  void dispose(){
    _timer.cancel();
    super.dispose();
  }
  void _goToAddBook(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder:(context)=> MyAddBook(onGroupCreation: false, groupName: ''),
    ),
    );
  }

  void _signOut(BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    bool hasSignedOut = await _currentUser.onSignOut();
    if (hasSignedOut == true) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => MyRoot()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //we do not need this anymore for the home page
      // appBar: AppBar(
      //   title: Text("Home page"),
      // ),
      //adding this so although we will stay connected throughout the current cycle
      //we can go back to the log in screen
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyContainer(
              child: Consumer<CurrentGroup>(
                builder: (BuildContext context, value, Widget? child) {
                  return Column(
                    children: <Widget>[
                      Text(
                        //"book1",
                        value.getCurrentBook.bookName ?? "loading...",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Due In: ",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                _timeUntilNextBook[0] ?? "loading..",
                                //"x days",
                                //value.getCurrentGroup.currentBookDue.toDate().toString(),
                                //(value.getCurrentGroup.currentBookDue!=null)? value.getCurrentGroup.currentBookDue.toDate().toString():"loading...",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Finished book",
                          style: TextStyle(
                            color: Colors.lime,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Next book \nrevealed in: ",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.pink,
                      ),
                    ),
                    Text(
                      //"x hours",
                      _timeUntilNextBook[1]??"loading",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: ElevatedButton(
              onPressed: () => _goToAddBook(context),
              child: Text(
                "Book Club history",
                style: TextStyle(
                  color: Colors.brown,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: ElevatedButton(
              onPressed: () => _signOut(context),
              child: Text("Sign Out"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(
                        color: Colors.transparent,
                        width: 2,
                      ),
                  ),
              ),
            ),
          )
        ],
        // child: Center(
        //     child: ElevatedButton(
        //       onPressed: () => _signOut(context)
        //     ,
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor: Color.fromARGB(162,151,135,100),
        //         padding: EdgeInsets.symmetric(horizontal: 100),
        //       ),
        //       child: Text(
        //         "Sign out",
        //         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
        //       ),
        //     ),
        // ),
      ),
    );
  }
}
