import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNoGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _goToJoinGroup() {}
    void _goToCreateGroup() {}
    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.all(80.0),
            child: Image.asset("assets/book.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
                "welcome! tra la la",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.red,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "write sth here",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.red,
              ),),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => _goToCreateGroup(),
                    child: Text("Create a group")),
                ElevatedButton(
                    onPressed: () => _goToJoinGroup(),
                    child: Text(
                      "Join a group",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
