import 'package:flutter/material.dart';

import 'package:ukmblooddonation/faq/faq_question_model.dart';

class FaqQuestion {
  final Question question;
  final questionTextStyle;
  final answerTextStyle;

  FaqQuestion(
      {
        required this.question,
        this.questionTextStyle =const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        this.answerTextStyle = const TextStyle(fontSize: 20),
        
      }
  );

  ExpansionPanelRadio create() {
    return ExpansionPanelRadio(
      value: question.id,
      canTapOnHeader: true,
      headerBuilder: (_, isExpanded) => Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Text(
            question.question,
            style: questionTextStyle,
          )),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Text(
          question.answer,
          style: answerTextStyle,
        ),
      ),
    );
  }
}
