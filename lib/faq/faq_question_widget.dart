import 'package:flutter/material.dart';

import 'faq_question_model.dart';

class FaqQuestionWidget {
  final FaqQuestion question;
  final TextStyle questionTextStyle;
  final TextStyle answerTextStyle;

  FaqQuestionWidget({
    required this.question,
    this.questionTextStyle =
        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    this.answerTextStyle = const TextStyle(fontSize: 20),
  });

  ExpansionPanelRadio create() {
    return ExpansionPanelRadio(
      value: question.id,
      canTapOnHeader: true,
      headerBuilder: (_, isExpanded) => Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Text(
            question.question,
            style: questionTextStyle,
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Text(
          question.answer,
          style: answerTextStyle,
        ),
      ),
    );
  }
}