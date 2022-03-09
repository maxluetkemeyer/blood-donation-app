import 'package:blooddonation/services/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:blooddonation/booking/process/parts/donation_questions/question_widget.dart';

class QuestionSlider extends ConsumerWidget {
  final List<Map<String, dynamic>> questions;

  const QuestionSlider({
    Key? key,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    int questionStep = ref.watch(questionStepStateProvier.state).state;

    if (questions.isEmpty) {
      return Center(
        child: Text(AppLocalizations.of(context)!.bookingErrorLoadingQuestions),
      );
    }

    return QuestionWidget(
      question: questions[questionStep]["donationQuestion"],
      translation: questions[questionStep]["donationQuestionTranslation"],
      nextQuestionFunc: questionStep == (questions.length - 1)
          ? () {
              //Last DonationQuestion, so goto next booking step
              ref.read(bookingStateProvider.state).state++;
            }
          : () {
              //Show next DonationQuest
              ref.read(questionStepStateProvier.state).state++;
            },
    );
  }
}
