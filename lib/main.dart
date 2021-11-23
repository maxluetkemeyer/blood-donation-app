import './onboarding/onboarding_view.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './home/home.dart';
import 'services/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: prefer_const_constructors
  runApp(ProviderScope(child: MyApp()));

  final Services services = Services.instance;
  services.initServices();
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('de', ''), // German, no country code
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 242, 242, 247),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).primaryColor,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      home: FutureBuilder<bool>(
        future: showOnboarding(),
        builder: (buildContext, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!) {
              // Home
              return const HomeView();
            }

            // Onboarding
            return const OnboardingView();
          }

          return const HomeView();
        },
      ),
    );
  }

  Future<bool> showOnboarding() async {
    //Do not show onboarding in web version
    if (kIsWeb) return true;

    //maybe use UserService for this
    //load persistent data to check onboarded status
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final alreadyOnboarded = prefs.getBool("alreadyOnboarded") ?? false;

    return alreadyOnboarded;
  }
}
