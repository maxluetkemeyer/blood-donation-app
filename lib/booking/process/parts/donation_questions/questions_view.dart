import 'package:blooddonation/booking/process/parts/donation_questions/slider.dart';
import 'package:blooddonation/services/backend/requests/get_donationquestions.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/provider/providers.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionsView extends ConsumerWidget {
  const QuestionsView({Key? key}) : super(key: key);

  ///Build method to build the question iterable page. Utilizes [questionStepStateProvier] to access the current question.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: getDonationQuestions(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          ref.read(questionStepStateProvier.state).state = 0;

          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!(snapshot.data as bool)) {
          return const Center(child: Text("Es ist ein Fehler aufgetreten beim Laden der Spende Fragen."));
        }

        return QuestionSlider(
          questions: BookingService().getDonationQuestionList(language: UserService().language),
        );
      },
    );
  }
}
