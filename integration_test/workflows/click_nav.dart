import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

Future<void> workflowApp(WidgetTester tester) async{
  //clicks the Navigationbar item with the key appointment
  final navButt = find.byKey(const Key('appointment'));

  expect(navButt, findsOneWidget);

  await tester.tap(navButt);

  await tester.pump();

  return;
}

Future<void> workflowStart(WidgetTester tester) async{
  //clicks the Navigationbar item with the key start
  final navButt = find.byKey(const Key('start'));

  expect(navButt, findsOneWidget);

  await tester.tap(navButt);

  await tester.pump();

  return;
}

Future<void> workflowMap(WidgetTester tester) async{
  //clicks the Navigationbar item with the key map
  final navButt = find.byKey(const Key('map'));

  expect(navButt, findsOneWidget);

  await tester.tap(navButt);

  await tester.pump();

  return;
}

Future<void> workflowFaq(WidgetTester tester) async{
  //clicks the Navigationbar item with the key faq
  final navButt = find.byKey(const ValueKey('faq'));

  expect(navButt, findsOneWidget);

  await tester.tap(navButt);

  await tester.pump();

  return;
}

Future<void> workflowPopUpNav(WidgetTester tester) async{
  //clicks the Pop-Up navigation bar with the key popUpDots
  final popUpNav = find.byKey(const Key('popUpDots'));

  expect(popUpNav, findsOneWidget);

  await tester.tap(popUpNav);

  await tester.pump();

  return;
}

Future<void> workflowNavImpr(WidgetTester tester) async{
  //clicks the imprint navigation bar the key imprintButton
  final navImpr = find.byKey(const Key('imprintButton'));

  expect(navImpr, findsOneWidget);

  await tester.tap(navImpr);

  await tester.pump();

  return;
}

Future<void> workflowNavUserData(WidgetTester tester) async{
  //clicks the user data navigation bar the key imprintButton
  final navUserData = find.byKey(const Key('userDataButton'));

  expect(navUserData, findsOneWidget);

  await tester.tap(navUserData);
  
  await tester.pump();
  return;
}

Future<void> workflowNavHelp(WidgetTester tester) async{
  //clicks the user data navigation bar the key imprintButton
  final navHelp = find.byKey(const Key('helpButton'));

  expect(navHelp, findsOneWidget);

  await tester.tap(navHelp);
  
  await tester.pump();
  return;
}