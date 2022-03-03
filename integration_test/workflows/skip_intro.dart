import 'package:flutter_test/flutter_test.dart';

Future<void> workflow(WidgetTester tester) async{
  //Skip Intro
  await tester.pumpAndSettle();

  final buttonNext = find.text('Weiter');

  expect(buttonNext, findsOneWidget);
      
  await tester.tap(buttonNext);

  await tester.pumpAndSettle();

  return;
}