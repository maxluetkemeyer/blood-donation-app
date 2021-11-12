import 'package:blooddonation/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'question_widget.dart';
import 'donationquestion_model.dart';

class QuestionsView extends ConsumerWidget {
  const QuestionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int questionStep = ref.watch(questionStepStateProvier.state).state;

    return getQuestion(questionStep, ref);
  }

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
