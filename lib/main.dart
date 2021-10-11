import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './onboard/firstcontact.dart';
import './theme.dart';
import './Home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: lightTheme,
      home: FutureBuilder<bool>(
        future: showOnboarding(),
        builder: (buildContext, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!) {
              // Onboarding
              return FirstContact();
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
    return false;
    /*
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final alreadyOnboarded = prefs.getBool("alreadyOnboarded");

    return alreadyOnboarded == null;
    */
  }
}
