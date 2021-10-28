import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart' as app;
import 'package:shared_preferences/shared_preferences.dart';



void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('FAQList Test', () {
    testWidgets(
        'Given the Application is started When pressing map on the navigationBar FAQ Then the new window pops up and works functionally',
        (WidgetTester tester) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();
      
      app.main();

      //Skip Intro
      await tester.pumpAndSettle();

      final buttonNext = find.text('Weiter');

      expect(buttonNext, findsOneWidget);
      
      await tester.tap(buttonNext);

      await tester.pumpAndSettle();

      final buttonFaq = find.byKey(Key('faq'));

      expect(buttonFaq, findsOneWidget);

      await tester.tap(buttonFaq);

      await tester.pumpAndSettle();

      final question = find.text('Wer darf Blutspenden?');

      await tester.tap(question);

      await tester.pumpAndSettle();

      final resOneTap = find.text('Entweder über den Startbildschirm oder über das Menü kann man Anmeldung auswählen. Bevor man sich einen Termin aussuchen kann, werden ein paar generelle Fragen gestellt, die eine Blutspende verhindern könnten. Sollte nach den Fragen eine Blutspende möglich kein, kann über die Kalenderfunktion ein Termin ausgewählt werden. Der Termin ist verbindlich, wenn er in der App als bestätigt gilt.');

      expect(resOneTap, findsOneWidget);
    });

    testWidgets(
        'Given the application is started When an appointment navigationBar is clicked Then the First personal question is shown',
        (WidgetTester tester) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();
      
      app.main();

      //Skip Intro
      await tester.pumpAndSettle();

      final buttonNext = find.text('Weiter');

      expect(buttonNext, findsOneWidget);
      
      await tester.tap(buttonNext);

      await tester.pumpAndSettle();

      final navButt = find.byKey(Key('appointment'));

      expect(navButt, findsOneWidget);

      await tester.tap(navButt);

      await tester.pumpAndSettle();

      final buttonApp = find.text('Termin buchen');

      expect(buttonApp, findsOneWidget);

      await tester.tap(buttonApp);

      await tester.pumpAndSettle();
      
      final noButton = find.text("Buchungsvorgang abbrechen");

      expect(noButton, findsOneWidget);
    });
  });
}
