import 'package:blooddonation/app.dart';
import 'package:blooddonation/models/donationquestions_model.dart';
import 'package:blooddonation/models/donationquestiontranslation_model.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


///Class to define one booking question.
///
///Inputs include a required [question] from the type [DonationQuestion] to define
///the shown question itself and last but not least the [nextQuestionFunc] which is utilized to call to
///the next page.
class QuestionWidget extends StatelessWidget {
  final DonationQuestion question;
  final DonationQuestionTranslation translation;
  final Function nextQuestionFunc;

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
                } else {
                  wrongAnswere(context);
                }
              },
              icon: const Icon(Icons.done),
              label: Text(AppLocalizations.of(context)!.donationQuestionAnswerYes),
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
                } else {
                  wrongAnswere(context);
                }
              },
              icon: const Icon(Icons.close),
              label: Text(AppLocalizations.of(context)!.donationQuestionAnswerNo),
            ),
          ),
        ],
      ),
    );
  }

  void wrongAnswere(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(AppLocalizations.of(context)!.donationQuestionAnswerApprovement,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        content: Column(
          children:[
            const SizedBox(height: 10),
            Text(AppLocalizations.of(context)!.donationQuestionAnswerRefusal,
              style: const TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.back),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const App(initalPageIndex: 3)), (route) => false);
              BookingService().resetProcess();
            },
            child: Text(AppLocalizations.of(context)!.forwardingToFAQ),
          ),
        ],
      ),
    );
  }
}
