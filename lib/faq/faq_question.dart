import 'package:flutter/material.dart';

import 'faq_question_model.dart';



class FaqQuestion {
  final Question question;
  final questionTextStyle;
  final answerTextStyle;
  final Key key;

  FaqQuestion(
      {
        required this.question,
        required this.key,
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
