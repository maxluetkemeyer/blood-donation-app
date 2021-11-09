import 'package:flutter/material.dart';

//final Color accCol = Color(0xff93001D);

final ThemeData lightTheme = ThemeData(
  // Primäre Farbe des Dokumentes (UKM Logo-Farbe dunkel)
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff003866),
  ),

  primaryColor: const Color(0xff003866),

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
      primary: const Color(0xff003866),
    ),
  ),
);
