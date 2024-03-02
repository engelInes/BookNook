import 'package:app/screens/home/homeScreen.dart';
import 'package:app/screens/login/login.dart';
import 'package:app/screens/noGroupScreen/noGroup.dart';
import 'package:app/screens/splash/splashScreen.dart';
import 'package:app/states/currGroup.dart';
import 'package:app/states/currUser.dart';
import 'package:app/widgets/myContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  unkownState,
  notLoggedIn,
  inGroup,
  notInGroup,
}
class MyRoot extends StatefulWidget{
  @override
  _MyRootState createState()=> _MyRootState();
}
class _MyRootState extends State<MyRoot>{
  AuthStatus _authStatus=AuthStatus.unkownState;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    CurrentUser _currentUser =
    Provider.of<CurrentUser>(context, listen: false);
    bool _returnedStart = await _currentUser.onStartUp();
    if(_returnedStart==true){
      if(_currentUser.getUser.groupID != null){
        setState(() {
          _authStatus = AuthStatus.inGroup;
        });
      }
      else {
        setState(() {
          _authStatus = AuthStatus.notInGroup;
        });
      }

    }
    else{
      setState(() {
        _authStatus=AuthStatus.notLoggedIn;
      });
    }
    // if (_returnedStart) {
    //   if (_currentUser.isAuthenticated) {
    //     if (_currentUser.getUser.groupID != null) {
    //       setState(() {
    //         _authStatus = AuthStatus.inGroup;
    //       });
    //     } else {
    //       setState(() {
    //         _authStatus = AuthStatus.notInGroup;
    //       });
    //     }
    //   } else {
    //     setState(() {
    //       _authStatus = AuthStatus.notLoggedIn;
    //     });
    //   }
    // } else {
    //   setState(() {
    //     _authStatus = AuthStatus.notLoggedIn;
    //   });
    // }
  }
  // void didChangeDependencies() async{
  //   super.didChangeDependencies();
  //   CurrentUser _currentUser=Provider.of<CurrentUser>(context,listen: false);
  //   bool _returnedStart= await _currentUser.onStartUp();
  //   if(_returnedStart==true){
  //     if(_currentUser.getUser.groupID != null){
  //       setState(() {
  //         _authStatus = AuthStatus.inGroup;
  //       });
  //     }
  //     else {
  //       setState(() {
  //         _authStatus = AuthStatus.notInGroup;
  //       });
  //     }
  //
  //   }
  //   else{
  //     setState(() {
  //       _authStatus=AuthStatus.notLoggedIn;
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    // return Consumer<CurrentUser>(
    //     builder: (context, currentUser, child) {
    //   _authStatus = currentUser.isAuthenticated
    //       ? (currentUser.getUser.groupID != null
    //       ? AuthStatus.inGroup
    //       : AuthStatus.notInGroup)
    //       : AuthStatus.notLoggedIn;

    Widget? returnedVal;
    switch(_authStatus){
      case AuthStatus.unkownState:
        returnedVal=MySplashScreen();
        break;
      case AuthStatus.notLoggedIn:
        returnedVal=MyLogin();
        break;
      case AuthStatus.notInGroup:
        returnedVal=MyNoGroup();
        break;
      case AuthStatus.inGroup:
        returnedVal=ChangeNotifierProvider(
            create: (context) => CurrentGroup(),
            child: HomeScreen()
        );
        break;
      default:
    }
    //return MyContainer();
    return returnedVal!;
  }

}