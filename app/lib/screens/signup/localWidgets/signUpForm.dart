import 'package:flutter/material.dart';
import 'package:app/states/currUser.dart';
import 'package:app/widgets/myContainer.dart';
import 'package:app/screens/signup/signup.dart';
import 'package:provider/provider.dart';

class MySignUpForm extends StatefulWidget{
  @override
  State<MySignUpForm> createState() => _MySignUpFormState();
}

// class _MySignUpFormState extends State<MySignUpForm> {
//   // @override
//   @override
//   Widget build(BuildContext context) {
//     return MyContainer(
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
//             child: Text("Create an account", style: TextStyle(
//               color: Colors.white,
//               fontSize: 25.0,
//               fontWeight: FontWeight.bold,
//             ),
//             ),
//           ),
//           TextFormField(decoration: InputDecoration(prefixIcon: Icon(Icons.person_outline),hintText: "Full Name"), ),
//           SizedBox(height: 20.0,),
//           TextFormField(decoration: InputDecoration(prefixIcon: Icon(Icons.alternate_email),hintText: "Email"), ),
//           SizedBox(height: 20.0,),
//           TextFormField(decoration: InputDecoration(prefixIcon: Icon(Icons.lock_outline),hintText: "Password"
//           ),
//             obscureText: true,
//           ),
//           SizedBox(height: 20.0,),
//           TextFormField(decoration: InputDecoration(prefixIcon: Icon(Icons.lock_open),hintText: "Confirm Password"
//           ),
//             obscureText: true,
//           ),
//           SizedBox(height: 20.0,),
//           //RaisedButton() not used anymore
//           // ElevatedButton(onPressed: onPressed: () {
//           //       setState(() {
//           //         istapped = 'Button tapped';
//           //       });
//           //     },
//           ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MySignUp(),),);
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color.fromARGB(162,151,135,100),
//               padding: EdgeInsets.symmetric(horizontal: 100),
//             ),
//             child: Text(
//               "Log in",
//               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
//             ),
//           ),
//           //           child: Padding(
//           //         padding: EdgeInsets.symmetric(
//           //           horizontal: 100),
//           //           child: Text(
//           //             "Log in",
//           //             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
//           //             ),
//           //             ),
//           //             )
//         ],
//       ),
//     );
//   }
// }

class _MySignUpFormState extends State<MySignUpForm> {

  TextEditingController _fullNameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _checkPasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            child: Text("Create an account", style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          TextFormField(
            controller: _fullNameController,
            decoration: InputDecoration(
                prefixIcon: Icon(
                    Icons.person_outline
                ),
                hintText: "Full Name"
            ),
          ),
          SizedBox(height: 20.0,),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
                prefixIcon: Icon(
                    Icons.alternate_email
                ),hintText: "Email"
            ),
          ),
          SizedBox(height: 20.0,),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),hintText: "Password"
            ),
            obscureText: true,
          ),
          SizedBox(height: 20.0,),
          TextFormField(
            controller: _checkPasswordController,
            decoration: InputDecoration(
                prefixIcon: Icon(
                    Icons.lock_open
                ),
                hintText: "Check password"
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
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MySignUp(),),);
              //   setState(() {
              //     istapped = 'Button tapped';
              //  });
              if(_passwordController.text==_checkPasswordController.text){
                _signUpUser(_emailController.text,_passwordController.text, context);
              }
              else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                    content: Text("Passwords do not match"),
                    duration: Duration(seconds: 2),
                  ),
                  );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(162,151,135,100),
              padding: EdgeInsets.symmetric(horizontal: 100),
            ),
            child: Text(
              "Sign up",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }

  void _signUpUser(String email, String psswd, BuildContext context) async{
    CurrentUser _currentUser=Provider.of<CurrentUser>(context,listen: false);
    try{
      if(await _currentUser.signUpUser(email, psswd)){
        Navigator.pop(context);//send the user back to the login screen
      }
      //Scaffold.of(context).showSnackBar()
    }
    catch(e){print(e);}
  }
}