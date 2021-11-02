import 'package:flutter_test/flutter_test.dart';

import 'package:blooddonation/main.dart' as app;
import 'package:shared_preferences/shared_preferences.dart';
import '../workflows/workflows.dart' as wf;

Future<void> booking() async {
  testWidgets(
      'Given the application is started When an appointment navigationBar is clicked Then the First personal question is shown',
      (WidgetTester tester) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();

    app.main();

    //Skip Intro
    await wf.skipIntro(tester);

    await wf.clickNavAppointments(tester);

    await wf.clickStartAppointments(tester);

    final noButton = find.text('No');

    expect(noButton, findsOneWidget);
  });
}
