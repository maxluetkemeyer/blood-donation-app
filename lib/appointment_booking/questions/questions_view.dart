import 'package:blooddonation/providers.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../booking/booking_view.dart';
import 'question_widget.dart';
import 'question_model.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({Key? key}) : super(key: key);

  @override
  _QuestionsViewState createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  Question testQuestion = Question(
    "Sind Sie positiv auf HIV getestet worden oder haben Sie die Befürchtung evtl. HIV-positiv zu sein?",
    false,
  );
  Question testQuestion2 = Question(
    "Wurden bei Ihnen oder einem Ihrer Blutsverwandten 1. Grades die Creutzfeldt-Jakob-Krankheit erkannt?",
    false,
  );

  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
        //initialPage: 0,
        );
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text("Blood Donation Appointment"),
        title: const Text("Termin buchen"),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                QuestionWidget(
                  question: testQuestion,
                  nextQuestionFunc: () {
                    _pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                QuestionWidget(
                  question: testQuestion2,
                  nextQuestionFunc: () {
                    _pageController.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                const BookingView()
              ],
            ),
          ),
          TextButton(
            onPressed: () => showCupertinoDialog(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                title: const Text(
                  "Möchtest du die Buchung abbrechen?",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                content: Column(
                  children: const [
                    SizedBox(height: 10),
                    Text(
                      "Dein bisheriger Fortschritt geht verloren.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                actions: [
                  CupertinoDialogAction(
                    isDestructiveAction: true,
                    onPressed: () {
                      //reset booking process
                      BookingService.instance.reset();
                      context.read(bookingStateProvider).state = 0;

                      //pop dialog, then pop booking process view
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    //child: const Text('Cancel Booking'),
                    child: const Text("Buchungsvorgang abbrechen"),
                  ),
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () => Navigator.pop(context),
                    //child: const Text('Back'),
                    child: const Text("Zurück"),
                  )
                ],
              ),
            ),
            //child: const Text("Cancel Booking"),
            child: const Text("Buchungsvorgang abbrechen"),
          ),
        ],
      ),
    );
  }
}
