import '../../lib/faq/faq_question.dart';
import '../../lib/faq/faq_question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FaqQuestion Tests', () {
    testWidgets(
        'Given One FaqQuestion is created When a Question is Tapped on Then a FaqAnswer is shown',
        (WidgetTester tester) async {
      //ARRANGE
      Question testfrage = const Question(
          id: 'q1', question: 'testquestion', answer: 'testanswer');
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: SingleChildScrollView(
            child: ExpansionPanelList.radio(
              children: [
                FaqQuestion(question: testfrage, key: ValueKey('test'))
                    .create(),
              ].toList(),
            ),
          ),
        ),
      ));

      //ACT
      final questionFinder = find.text('testquestion');
      await tester.tap(questionFinder);
      await tester.pumpAndSettle();
      final res = find.text('testanswer');

      //ASSERT
      expect(res, findsOneWidget);
    });
  
    testWidgets(
        'Given One FaqQuestion is created When a Question is Tapped twice Then no FaqAnswer is shown',
        (WidgetTester tester) async {
      //ARRANGE
      Question testfrage = const Question(
          id: 'q1', question: 'testquestion', answer: 'testanswer');
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: SingleChildScrollView(
            child: ExpansionPanelList.radio(
              children: [
                FaqQuestion(question: testfrage, key: ValueKey('test'))
                    .create(),
              ].toList(),
            ),
          ),
        ),
      ));

      //ACT
      final questionFinder = find.text('testquestion');
      await tester.tap(questionFinder);
      await tester.pumpAndSettle();
      await tester.tap(questionFinder);
      await tester.pumpAndSettle();
      final res = find.text('testanswer');

      //ASSERT
      expect(res, findsOneWidget);
    });
  });
}
