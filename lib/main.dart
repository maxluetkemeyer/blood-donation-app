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
  runApp(ProviderScope(child: MyApp()));

  final Services services = Services.instance;
  services.initServices();
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
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 242, 242, 247),
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
              return HomeView();
            }

            // Onboarding
            return OnboardingView();
          }

          return HomeView();
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
