import 'package:blooddonation/services/backend/backend_service.dart';
import 'package:blooddonation/services/background/notification_service.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/faq/faq_service.dart';
import 'package:blooddonation/services/provider/provider_service.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/services.dart';
import 'package:showcaseview/showcaseview.dart';

import './onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'misc/theme.dart';

///Start of application
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ProviderService();
  UserService();
  FaqService();
  BookingService();
  BackendService();
  NotificationService().init();

  runApp(const MainWidget());
}

/// This is the main application widget.
class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    ProviderService().container.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UncontrolledProviderScope(
      container: ProviderService().container,
      child: Consumer(
        builder: (context, ref, child) => ShowCaseWidget(
          builder: Builder(
            builder: (context) => MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: const [
                Locale('en', ''), // English, no country code
                Locale('de', ''), // German, no country code
              ],
              locale: ref.watch(localeProvider.state).state,
              onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle,
              theme: lightTheme,
              home: FutureBuilder<bool>(
                future: showOnboarding(), // a previously-obtained Future<bool> or null
                builder: (BuildContext buildContext, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!) {
                      NotificationService().requestIosPermissions();
      
                      // Open HomeView, if the built Future is resolved and false
                      return const App();
                    }
                    NotificationService().requestIosPermissions();
      
                    // Open Onboarding, if the built Future is resolved and true
                    return const OnboardingView();
                  }
                  // Open HomeView, if the built Future isn't resolved
                  return const App();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///Confirms whether the application shows the Onboarding screen or not.
  ///The function checks whether the user has already onboarded before.
  Future<bool> showOnboarding() async {
    //maybe use UserService for this
    //load persistent data to check onboarded status
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final alreadyOnboarded = prefs.getBool("alreadyOnboarded") ?? false;

    return alreadyOnboarded;
  }
}
