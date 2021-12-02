import 'package:shared_preferences/shared_preferences.dart';

import 'package:blooddonation/main.dart' as app;

Future<void> init() async {
  //initializing the testsuite by clearing all shared preferences and starting the app
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();

  await preferences.setBool("alreadyOnboarded", true);

  app.main();
}
