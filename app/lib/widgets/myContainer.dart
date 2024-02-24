//using this multiple times in the app
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget{

  final Widget child;

  const MyContainer({Key? key, required this.child}) : super(key: key);

  //const MyContainer({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(172,169,163,100),
        borderRadius: BorderRadius.circular(80.0),
        boxShadow: [
          BoxShadow(
            color: Colors.brown,
            blurRadius: 10.0,
            spreadRadius: 1.0,
            offset: Offset(
              4.0,
              4.0,
            ),
          )
        ],
      ),
      child: child,
    );
  }

}