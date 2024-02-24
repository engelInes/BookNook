import 'package:app/screens/homeScreen.dart';
import 'package:app/states/currUser.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/signup/signup.dart';
import 'package:app/widgets/myContainer.dart';
import 'package:provider/provider.dart';

class myLoginForm extends StatefulWidget{
  @override
  State<myLoginForm> createState() => _myLoginFormState();
}

class _myLoginFormState extends State<myLoginForm> {
  String istapped="";
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            child: Text("Log in", style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(prefixIcon: Icon(Icons.alternate_email),hintText: "Email"
            ),
          ),
          SizedBox(height: 20.0,),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(prefixIcon: Icon(Icons.lock_outline),hintText: "Password"
          ),
            obscureText: true,
          ),
          SizedBox(height: 20.0,),
          //RaisedButton() not used anymore
          // ElevatedButton(onPressed: onPressed: () {
          //       setState(() {
          //         istapped = 'Button tapped';
          //       });
          //     },
          ElevatedButton(
            onPressed: () {
              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MySignUp(),),);
              _loginUser(_emailController.text,_passwordController.text,context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(162,151,135,100),
              padding: EdgeInsets.symmetric(horizontal: 100),
            ),
            child: Text(
              "Log in",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          //           child: Padding(
          //         padding: EdgeInsets.symmetric(
          //           horizontal: 100),
          //           child: Text(
          //             "Log in",
          //             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
          //             ),
          //             ),
          //             )
          //FlatButton()
          TextButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=>MySignUp(),
                ),
              );
            },
            child: Text("Don't have an account? Create an account"),

          )
        ],
      ),
    );
  }
}

void _loginUser(String email, String psswd, BuildContext context) async{
  CurrentUser _currentUser=Provider.of<CurrentUser>(context,listen:false);
  try{
    if(await _currentUser.logInUser(email, psswd)){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=>HomeScreen())
      );
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Incorrect email or password"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
  catch(e){
    print(e);
  }
}