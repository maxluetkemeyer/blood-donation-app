import '../lib/main.dart' as app;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();

  app.main();
}