import 'package:flutter/material.dart';

import '../models/faq_question_model.dart';


///Class to define one Faq question.
///
///Inputs include the [key] variable, a required [question] from the type [FaqQuestion] to define
///the shown question itself and last but not least the [questionTextStyle] and the [answerTextStyle] to
///define the optics of the shown [FaqQuestionWidget].
class FaqQuestionWidget {
  final FaqQuestion question;
  final TextStyle questionTextStyle;
  final TextStyle answerTextStyle;
  final Key? key;

  ///Constructor of the class FaqQuestionWidget.
  FaqQuestionWidget({
    this.key,
    required this.question,
    this.questionTextStyle =
        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    this.answerTextStyle = const TextStyle(fontSize: 20),
  });

  ///Returns one [ExpansionPanelRadio] with variables defined in its constructor [FaqQuestionWidget]
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
