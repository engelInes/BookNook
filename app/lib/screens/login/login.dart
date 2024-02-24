import 'package:flutter/material.dart';
import 'package:app/screens/login/localWidgets/loginForm.dart';

class MyLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(60.0),
                  child: Image.asset("assets/book.png"),
                  //child: Color.fromARGB(172,169,163,100),
                ),
                SizedBox(height: 100.0,),//the box where you enter the data
                myLoginForm(),
              ],
            ),
          )
        ],
      ),
    );
  }

}