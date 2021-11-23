import '../lib/main.dart' as app;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async{
  //initializing the testsuite by clearing all shared preferences and starting the app
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
  
  app.main();
}