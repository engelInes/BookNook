import 'package:app/screens/home/homeScreen.dart';
import 'package:app/screens/login/login.dart';
import 'package:app/states/currUser.dart';
import 'package:app/widgets/myContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  notLoggedIn,
  loggedIn,
}
class MyRoot extends StatefulWidget{
  @override
  _MyRootState createState()=> _MyRootState();
}
class _MyRootState extends State<MyRoot>{
  AuthStatus _authStatus=AuthStatus.notLoggedIn;

  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    CurrentUser _currentUser=Provider.of<CurrentUser>(context,listen: false);
    bool _returnedStart= await _currentUser.onStartUp();
    if(_returnedStart==true){
      setState(() {
        _authStatus=AuthStatus.loggedIn;
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    Widget? returnedVal;
    switch(_authStatus){
      case AuthStatus.notLoggedIn:
        returnedVal=MyLogin();
        break;
      case AuthStatus.loggedIn:
        returnedVal=HomeScreen();
        break;
      default:
    }
    //return MyContainer();
    return returnedVal!;
  }

}