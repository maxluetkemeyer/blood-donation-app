import 'package:flutter/material.dart';

import 'faq_question_model.dart';


/* 
This class creates one Element for the ExpansionPanelList, namely a ExpansionPanelRadio.

Though it can't be seen as a Widget, it can onely be used by first initializing the class object and later called by the method create()
*/
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

  /*
  Puts out one the ExpansionPanelRadio with variables defined in its constructor
  */
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
