import 'package:flutter/material.dart';

class MyTheme{

  Color _lightBeige= Color.fromARGB(172,169,163,100);
  Color _lightBrown=Color.fromARGB(162,151,135,100);
  Color _lightGrey = Color.fromARGB(255, 164, 164, 164);
  Color _darkerGrey = Color.fromARGB(255, 119, 124, 135);
  ThemeData buildTheme(){
    return ThemeData(
      canvasColor: _lightBeige,
      primaryColor: _lightBrown,
      secondaryHeaderColor: _darkerGrey,
      hintColor: _lightGrey,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(
              color: _lightBeige),
        ),
        //when we click on a field it will change its color
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(
              color: _lightGrey),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: _lightBrown,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        minWidth: 200,
        height: 40.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0)
        ),
      ),
    );
  }
}