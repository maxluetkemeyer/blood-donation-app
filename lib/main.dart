import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: import_of_legacy_library_into_null_safe
import './Home/home.dart';

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final alreadyOnboarded = prefs.getBool("alreadyOnboarded") ?? false;

  runApp(ProviderScope(
      child: MyApp(
    alreadyOnboarded: alreadyOnboarded,
  )));
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  final Color primCol = Color(0xff003866);
  final Color accCol = Color(0xff93001D);

  final bool alreadyOnboarded;

  MyApp({required this.alreadyOnboarded});

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
        dividerColor: accCol,

        fontFamily: 'Roboto',

        textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 16, color: Colors.white),
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
      home: alreadyOnboarded ? HomeView() : Container(),
    );
  }
}

// Provider
final tappedDayProvider = StateProvider<bool>((ref) {
  return false;
});

final selectedDayProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});
