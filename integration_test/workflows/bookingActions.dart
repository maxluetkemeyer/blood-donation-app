import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

Future<void> workflowClickDate(WidgetTester tester) async{
  //Click the 29th as Date during the current month in the booking process
  final findDate = find.text('29');

  expect(findDate, findsOneWidget);

  await tester.tap(findDate);

  await tester.pumpAndSettle();
}

Future<void> workflowClickTime(WidgetTester tester) async{
  //Click the '8:00h' time during the booking process
  final findTime = find.byKey(Key('0Cup'));

  expect(findTime, findsOneWidget);

  await tester.tap(findTime);

  await tester.pumpAndSettle();
}

