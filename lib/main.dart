import 'package:blooddonation/services/notification/notification_service.dart';
import 'package:blooddonation/services/provider/provider_service.dart';

import './onboarding/onboarding_view.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'misc/theme.dart';
import 'services/services.dart' as services;

///Start of application
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  services.startServices();

  runApp(const App());

  Future.delayed(const Duration(seconds: 4)).then(
    (_) => NotificationService().displayNotification(
      channelID: "booking_response",
      channelName: "Booking Status Response",
      channelDescription: "Booking Response Channel Description",
      notificationTitle: "notificationTitle",
      notificationBody: "notificationBody",
      payload: "payload",
    ),
  );
}

/// This is the main application widget.
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void dispose() {
    ProviderService().container.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UncontrolledProviderScope(
      container: ProviderService().container,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('de', ''), // German, no country code
        ],
        onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle,
        //generating the Theme
        theme: lightTheme,
        home: FutureBuilder<bool>(
          future: showOnboarding(), // a previously-obtained Future<bool> or null
          builder: (BuildContext buildContext, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!) {
                // Open HomeView, if the built Future is existing and false
                return const AppStructure();
              }
              // Open Onboarding, if the built Future is existing and true
              return const OnboardingView();
            }
            // Open HomeView, if the built Future isn't existing
            return const AppStructure();
          },
        ),
      ),
    );
  }

  ///Confirms whether the application shows the Onboarding screen or not.
  ///
  ///Checks [kIsWeb] if the application is run in a web browser, no Onboarding is shown. If not, the function checks whether
  ///the user has already onboarded before.
  ///
  ///returns [Future] specifically [boolean]
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
