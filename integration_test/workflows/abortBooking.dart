import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

Future<void> workflow(WidgetTester tester) async{
  //aborts the Booking process
  final cancelBooking = find.byKey(ValueKey('cancelBooking'));

  expect(cancelBooking, findsOneWidget);

  await tester.tap(cancelBooking);

  await tester.pumpAndSettle();

  final cancelBookingComp = find.byKey(ValueKey('cancelBookingComp'));

  expect(cancelBookingComp, findsOneWidget);

  await tester.tap(cancelBookingComp);

  await tester.pumpAndSettle();
}