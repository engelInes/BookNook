import 'package:flutter/material.dart';
import 'package:app/screens/signup/localWidgets/signupForm.dart';

class MySignUp extends StatelessWidget {
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
                //i want the arrow to be in a diff position from the default positioning (middle)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackButton(),
                  ],
                ),
                //MySignUp(),
                SizedBox(
                  height: 20.0,
                ),
                MySignUpForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
