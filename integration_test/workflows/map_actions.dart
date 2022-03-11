import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

Future<void> workflowPanorama(WidgetTester tester) async{
  //clicks the panorama image with the map screen
  final panorama = find.byKey(const Key('panoramaImage'));

  expect(panorama, findsOneWidget);

  await tester.tap(panorama);

  await tester.pump();

  return;
}

Future<void> workflowStreetMap(WidgetTester tester) async{
  //scrolles down and clicks the map image with the map screen
  final streetMap = find.byKey(const ValueKey("streetMap"));

  expect(streetMap, findsOneWidget);

  await tester.scrollUntilVisible(streetMap, 500);

  await tester.pump();

  await Future.delayed(const Duration(seconds: 2));

  await tester.tap(streetMap);

  await tester.pump();

  return;
}