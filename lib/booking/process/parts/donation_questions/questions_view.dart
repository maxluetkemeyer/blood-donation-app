import 'package:blooddonation/booking/process/parts/donation_questions/slider.dart';
import 'package:blooddonation/services/backend/requests/get_donationquestions.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/provider/provider_service.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({Key? key}) : super(key: key);

  ///Build method to build the question iterable page. Utilizes [questionStepStateProvier] to access the current question.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDonationQuestions(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          ProviderService().container.read(questionStepStateProvier.state).state = 0;

          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!(snapshot.data as bool)) {
          return Center(child: Text(AppLocalizations.of(context)!.bookingErrorLoadingQuestions));
        }

        return QuestionSlider(
          questions: BookingService().getDonationQuestionList(language: UserService().language),
        );
      },
    );
  }
}
