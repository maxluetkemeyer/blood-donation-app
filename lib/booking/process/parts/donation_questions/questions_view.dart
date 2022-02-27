import 'package:blooddonation/services/backend/requests/get_donationquestions.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionsView extends ConsumerWidget {
  const QuestionsView({Key? key}) : super(key: key);

  ///Build method to build the question iterable page. Utilizes [questionStepStateProvier] to access the current question.
  ///
  ///Returns a [Widget] tree.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    int questionStep = ref.watch(questionStepStateProvier.state).state;

    return FutureBuilder(
      future: getDonationQuestions(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!(snapshot.data as bool)) {
          return const Center(child: Text("Es ist ein Fehler aufgetreten beim Laden der Spende Fragen."));
        }

        // ignore: unused_local_variable
        List<Map<String, dynamic>> questions = BookingService().getDonationQuestionList(locale: "de_DE");

        return Container();
      },
    );
  }
}
