import '../../lib/faq/faq_question_model.dart';
import '../../lib/faq/faq_question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FaqQuestion Tests', () {
    testWidgets(
        'Given One FaqQuestion is created When a Question is Tapped on once Then a FaqAnswer is shown',
        (WidgetTester tester) async {
      //ARRANGE - generate the testquestion
      FaqQuestion testfrage = const FaqQuestion(
          id: 'q1', question: 'testquestion', answer: 'testanswer');
      bool isExpanded = false;

      await tester.pumpWidget(MaterialApp(
        home: SingleChildScrollView(
          child: ExpansionPanelList.radio(
            expansionCallback: (_, bool _isExpanded) {
              isExpanded = _isExpanded;
            },
            children: <ExpansionPanel>[
              FaqQuestionWidget(question: testfrage, key: ValueKey('test'))
                  .create(),
            ],
          ),
        ),
      ));

      //ACT - tapping the testquestion once
      final questionFinder = find.text('testquestion');
      await tester.tap(questionFinder);
      await tester.pumpAndSettle();

      //ASSERT - check if the testanswer can be seen
      expect(isExpanded, false);
    });

    testWidgets(
        'Given One FaqQuestion is created When a Question is Tapped twice Then no FaqAnswer is shown',
        (WidgetTester tester) async {
      //ARRANGE - generate the testquestion
      FaqQuestion testfrage = const FaqQuestion(
          id: 'q1', question: 'testquestion', answer: 'testanswer');
      bool isExpanded = false;

      await tester.pumpWidget(MaterialApp(
        home: SingleChildScrollView(
          child: ExpansionPanelList.radio(
            expansionCallback: (_, bool _isExpanded) {
              isExpanded = _isExpanded;
            },
            children: <ExpansionPanel>[
              FaqQuestionWidget(question: testfrage, key: ValueKey('test')).create(),
            ],
          ),
        ),
      ));

      //ACT - tap the testquestion twice
      final questionFinder = find.text('testquestion');
      await tester.tap(questionFinder);
      await tester.pumpAndSettle();
      await tester.tap(questionFinder);
      await tester.pumpAndSettle();

      //ASSERT - check, if the testanswer can be seen
      expect(isExpanded, true);
    });
  });
}
