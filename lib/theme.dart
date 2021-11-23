import 'package:flutter/material.dart';

//final Color accCol = Color(0xff93001D);
const primCol = Color(0xff003866);

final ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: primCol,
  ),
  primaryColor: primCol,
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 20, color: Colors.white),
      headline1: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      headline2: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5,
      primary: primCol,
    ),
  ),
);
