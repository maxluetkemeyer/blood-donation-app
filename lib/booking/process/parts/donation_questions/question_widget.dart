import 'package:blooddonation/models/donationquestions_model.dart';
import 'package:blooddonation/models/donationquestiontranslation_model.dart';
import 'package:flutter/material.dart';

///Class to define one booking question.
///
///Inputs include a required [question] from the type [DonationQuestion] to define
///the shown question itself and last but not least the [nextQuestionFunc] which is utilized to call to
///the next page.
class QuestionWidget extends StatelessWidget {
  final DonationQuestion question;
  final DonationQuestionTranslation translation;
  final Function nextQuestionFunc;

  ///Constructor of the class QuestionWidget.
  const QuestionWidget({
    Key? key,
    required this.question,
    required this.translation,
    required this.nextQuestionFunc,
  }) : super(key: key);

  ///Build method to build one donation question, utilizing the [DonationQuestion] as model to build the Widget tree.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Text(
              translation.body,
              style: TextStyle(fontSize: 30, color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton.icon(
              onPressed: () {
                if (question.isYesCorrect) {
                  nextQuestionFunc();
                }
              },
              icon: const Icon(Icons.done),
              label: const Text("Ja"),
              style: const ButtonStyle(),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton.icon(
              onPressed: () {
                if (!question.isYesCorrect) {
                  nextQuestionFunc();
                }
              },
              label: const Text("Nein"),
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
