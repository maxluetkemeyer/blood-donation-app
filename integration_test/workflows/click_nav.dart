import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

Future<void> workflowApp(WidgetTester tester) async{
  //clicks the Navigationbar item with the key appointment
  final navButt = find.byKey(const Key('appointment'));

  expect(navButt, findsOneWidget);

  await tester.tap(navButt);

  await tester.pumpAndSettle();

  return;
}

Future<void> workflowStart(WidgetTester tester) async{
  //clicks the Navigationbar item with the key start
  final navButt = find.byKey(const Key('start'));

  expect(navButt, findsOneWidget);

  await tester.tap(navButt);

  await tester.pumpAndSettle();

  return;
}

Future<void> workflowMap(WidgetTester tester) async{
  //clicks the Navigationbar item with the key map
  final navButt = find.byKey(const Key('map'));

  expect(navButt, findsOneWidget);

  await tester.tap(navButt);

  await tester.pumpAndSettle();

  return;
}

Future<void> workflowFaq(WidgetTester tester) async{
  //clicks the Navigationbar item with the key faq
  final navButt = find.byKey(const Key('faq'));

  expect(navButt, findsOneWidget);

  await tester.tap(navButt);

  await tester.pumpAndSettle();

  return;
}

Future<void> workflowPopUpNav(WidgetTester tester) async{
  //clicks the Pop-Up navigation bar with the key popUpDots
  final popUpNav = find.byKey(const Key('popUpDots'));

  expect(popUpNav, findsOneWidget);

  await tester.tap(popUpNav);

  await tester.pumpAndSettle();

  return;
}

Future<void> workflowNavImpr(WidgetTester tester) async{
  //clicks the imprint navigation bar the key imprintButton
  final navImpr = find.byKey(const Key('imprintButton'));

  expect(navImpr, findsOneWidget);

  await tester.tap(navImpr);

  await tester.pumpAndSettle();

  return;
}

Future<void> workflowNavUserData(WidgetTester tester) async{
  //clicks the imprint navigation bar the key imprintButton
  final navImpr = find.byKey(const Key('imprintButton'));

  expect(navImpr, findsOneWidget);

  await tester.tap(navImpr);

  await tester.pumpAndSettle();

  return;
}