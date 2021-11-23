import 'package:flutter/material.dart';

import 'faq_question_model.dart';

class FaqQuestionWidget {
  final FaqQuestion question;
  final TextStyle questionTextStyle;
  final TextStyle answerTextStyle;
  final Key? key;

  FaqQuestionWidget({
    this.key,
    required this.question,
    this.questionTextStyle =
        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    this.answerTextStyle = const TextStyle(fontSize: 20),
  });

  /*
  Puts out one the ExpansionPanelRadio with variables defined in its constructor
  */
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
