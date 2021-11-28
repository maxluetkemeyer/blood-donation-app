import 'package:blooddonation/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'question_widget.dart';
import 'donationquestion_model.dart';

class QuestionsView extends ConsumerWidget {
  const QuestionsView({Key? key}) : super(key: key);

  ///Build method to build the question iterable page. Utilizes [questionStepStateProvier] to access the current question.
  ///
  ///Returns a [Widget] tree.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int questionStep = ref.watch(questionStepStateProvier.state).state;

    return getQuestion(questionStep, ref);
  }

  ///Fetches the next donation relevant question for the [build] method.
  ///
  ///Needs the [questionStep], meaning the current question that is asked of the user and [ref] to access the provider.
  ///
  ///Returns a [Widget], specifically a [QuestionWidget]
  Widget getQuestion(int questionStep, WidgetRef ref) {
    final DonationQuestion testQuestion = DonationQuestion(
      "Sind Sie positiv auf HIV getestet worden oder haben Sie die Befürchtung evtl. HIV-positiv zu sein?",
      false,
    );
    final DonationQuestion testQuestion2 = DonationQuestion(
      "Wurden bei Ihnen oder einem Ihrer Blutsverwandten 1. Grades die Creutzfeldt-Jakob-Krankheit erkannt?",
      false,
    );

    if (questionStep == 0) {
      return QuestionWidget(
        question: testQuestion,
        nextQuestionFunc: () {
          ref.read(questionStepStateProvier.state).state++;
        },
      );
    }

    return QuestionWidget(
      question: testQuestion2,
      nextQuestionFunc: () {
        ref.read(bookingStateProvider.state).state++;
      },
    );
  }
}
