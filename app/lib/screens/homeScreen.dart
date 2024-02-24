import 'package:app/screens/rootScreen/rootS.dart';
import 'package:app/states/currUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      //adding this so although we will stay connected throughout the current cycle
      //we can go back to the log in screen
      body: Center(
          child: ElevatedButton(
            onPressed: () async{
              CurrentUser _currentUser=Provider.of<CurrentUser>(context,listen:false);
              bool hasSignedOut= await _currentUser.onSignOut();
              if(hasSignedOut==true){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MyRoot()), (route) => false);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(162,151,135,100),
              padding: EdgeInsets.symmetric(horizontal: 100),
            ),
            child: Text(
              "Sign out",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
      ),
      );
  }

}