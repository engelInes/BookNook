import 'package:app/screens/rootScreen/rootS.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/login/login.dart';
import 'package:app/states/currUser.dart';
import 'package:app/utils/myTheme.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{

// ...
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// Future<void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider(
  //     create: (context)=>CurrentUser(),
  //     child: MaterialApp(
  //       debugShowCheckedModeBanner: false,//to see the whole app
  //       theme: MyTheme().buildTheme(),//.()=create an instance
  //       home: MyLogin(),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          theme: MyTheme().buildTheme(),//.()=create an instance
          //home: MyLogin(),
          home:MyRoot() ,
      ),
    );
  }
}

