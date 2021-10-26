import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blooddonation/appointment_booking/frage_model.dart';
import 'package:blooddonation/appointment_booking/frage.dart';

void main() {
  testWidgets(
      'Given the Question Widget When a Question and Function is given Then a Card with the Question text is created and two Elevated Buttons',
      (WidgetTester tester) async {
    //ARRANGE
    Frage testfrage = Frage('Testfrage', true);
    await tester.pumpWidget(ProviderScope(
      child: MaterialApp(
        home: FragenWidget(
          frage: testfrage,
          nextQuestionFunc: () {
            return null;
          },
        ),
      ),
    ));

    //ACT
    final questionFinder = find.text('Testfrage');
    final elButtonFinderJ = find.text('Ja');
    final elButtonFinderN = find.text('Nein');

    //ASSERT
    expect(questionFinder, findsOneWidget);
    expect(elButtonFinderJ, findsOneWidget);
    expect(elButtonFinderN, findsOneWidget);
  });
}
