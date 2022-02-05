import 'package:flutter/material.dart';

import '../models/faqquestion_model.dart';

///Class to define one Faq question.
///
///Inputs include a required [question] from the type [FaqQuestion] to define
///the shown question itself and the [questionTextStyle] and the [answerTextStyle] to
///define the optics of the shown [FaqQuestionWidget].
class FaqQuestionPanel extends ExpansionPanelRadio {
  final FaqQuestion question;
  final TextStyle questionTextStyle;
  final TextStyle answerTextStyle;

  ///Constructor of the class FaqQuestionWidget.
  FaqQuestionPanel({
    required this.question,
    this.questionTextStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    this.answerTextStyle = const TextStyle(fontSize: 20),
  }) : super(
          value: question.id,
          canTapOnHeader: true,
          headerBuilder: (_, isExpanded) => Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Text(
                "question.question",
                style: questionTextStyle,
              )),
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Text(
              "question.answer",
              style: answerTextStyle,
            ),
          ),
        );
}
