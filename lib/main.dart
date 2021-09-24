//@dart = 2.9

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


import './onboard/onboarding.dart';
import './Home/home.dart';
import 'faq/faq_view.dart';

// Main
void main() {
  runApp(ProviderScope(child: MyApp()));
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'FAQ zur Blutspende';
  final Color primCol = Color(0xff003866);
  final Color accCol = Color(0xff93001D);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UKM Blutspende",
      debugShowCheckedModeBanner: false,
      // TODO: Theme Ändern!!
      theme: ThemeData(
        // Primäre Farbe des Dokumentes (UKM Logo-Farbe dunkel)
        appBarTheme: AppBarTheme(
          backgroundColor: primCol,
        ),

        primaryColor: primCol,

        fontFamily: 'Roboto',

        textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 20, color: Colors.white),
            headline1: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            headline2: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black)),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            primary: primCol,
          ),
        ),
      ),
      home: OnBoard(),
    );
  }
}
