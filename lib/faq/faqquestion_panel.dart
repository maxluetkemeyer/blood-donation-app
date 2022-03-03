import 'package:blooddonation/services/faq/faq_service.dart';
import 'package:flutter/material.dart';

///Class to define one Faq question.
///
///Inputs include a required [question] from the type [FaqQuestion] to define
///the shown question itself and the [questionTextStyle] and the [answerTextStyle] to
///define the optics of the shown [FaqQuestionWidget].
class FaqQuestionPanel extends ExpansionPanelRadio {
  final FaqQuestionTranslation translation;
  final TextStyle questionTextStyle;
  final TextStyle answerTextStyle;

  ///Constructor of the class FaqQuestionWidget.
  FaqQuestionPanel({
    required this.translation,
    this.questionTextStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    this.answerTextStyle = const TextStyle(fontSize: 20),
  }) : super(
          value: translation.id,
          canTapOnHeader: true,
          headerBuilder: (_, isExpanded) => Container(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 20,
              ),
              child: Text(
                translation.head,
                style: questionTextStyle,
              )),
          body: Container(
            padding: const EdgeInsets.only(
              top: 0,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: SelectableText(
              translation.body,
              style: answerTextStyle,
            ),
          ),
        );
}
