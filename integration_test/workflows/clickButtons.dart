import 'package:flutter_test/flutter_test.dart';

Future<void> workflow(WidgetTester tester) async {
  //click button to start appointment booking
  final buttonApp = find.text('Termin buchen');

  expect(buttonApp, findsOneWidget);

  await tester.tap(buttonApp);

  await tester.pumpAndSettle();
}

Future<void> workflowNoButton(WidgetTester tester) async {
  //click no button in the pre-appointment questions
  final noButton = find.text('No');

  expect(noButton, findsOneWidget);

  await tester.tap(noButton);

  await tester.pumpAndSettle();
}
