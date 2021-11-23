import './onboarding/onboarding_view.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './home/home.dart';
import 'services/services.dart';

///Starting the blood-donation application 
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const ProviderScope(child: MyApp()));

  final Services services = Services.instance;
  services.initServices();
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  ///Generate the Theme for the application. The function utilizes [context] to let the function access
  ///the app data
  ThemeData createTheme(BuildContext context){
    return ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 242, 242, 247),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).primaryColor,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      );
  }

  ///Builds the blood-donation application
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
      //generating the Theme
      theme: createTheme(context),
      home: FutureBuilder<bool>(
        future: showOnboarding(), // a previously-obtained Future<bool> or null
        builder: (BuildContext buildContext, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!) {
              // Open HomeView, if the built Future is existing and false
              return const HomeView();
            }
            // Open Onboarding, if the built Future is existing and true
            return const OnboardingView();
          }
          // Open HomeView, if the built Future isn't existing
          return const HomeView();
        },
      ),
    );
  }

  ///Confirms whether the application shows the Onboarding screen or not.
  ///
  ///Checks [kIsWeb] if the application is run in a web browser, no Onboarding is shown. If not, the function checks whether
  ///the user has already onboarded before.
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
