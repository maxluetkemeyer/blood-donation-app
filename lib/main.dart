//@dart = 2.9
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './onboard/onboarding.dart';
import './Home/home.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  final Color primCol = Color(0xff003866);
  final Color accCol = Color(0xff93001D);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UKM Blutspende",
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('fr')
      ],
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
      home: FutureBuilder<bool>(
        future: showOnboarding(),
        builder: (buildContext, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data) {
              // Onboarding
              return OnBoard();
            }
            // Home
            return HomeView();
          } else {
            // Return loading screen while reading preferences
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<bool> showOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final alreadyOnboarded = prefs.getBool("alreadyOnboarded");

    return alreadyOnboarded == null;
  }
}

// Provider
final tappedDayProvider = StateProvider<bool>((ref) {
  return false;
});

final selectedDayProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});
