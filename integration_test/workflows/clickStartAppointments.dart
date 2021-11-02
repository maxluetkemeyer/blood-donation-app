import 'package:flutter_test/flutter_test.dart';

Future<void> workflow(WidgetTester tester) async{
  //click button to start appointment booking
  final buttonApp = find.text('Termin buchen');

  expect(buttonApp, findsOneWidget);

  await tester.tap(buttonApp);

  await tester.pumpAndSettle();
}