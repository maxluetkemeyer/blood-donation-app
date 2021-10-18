import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ukmblooddonation/appointment_booking/booking_view.dart';

import 'frage.dart';
import 'frage_model.dart';

class TerminBuchung extends StatefulWidget {
  const TerminBuchung({Key? key}) : super(key: key);

  @override
  _TerminBuchungState createState() => _TerminBuchungState();
}

class _TerminBuchungState extends State<TerminBuchung> {
  Frage testFrage = Frage(
    "Sind Sie positiv auf HIV getestet worden oder haben Sie die Befürchtung evtl. HIV-positiv zu sein?",
    false,
  );
  Frage testFrage2 = Frage(
    "Wurden bei Ihnen oder einem Ihrer Blutsverwandten 1. Grades die Creutzfeldt-Jakob-Krankheit erkannt?",
    false,
  );

  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: 0,
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
        title: Text("Blutspende Termin"),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                FragenWidget(
                  frage: testFrage,
                  nextQuestionFunc: () {
                    _pageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                FragenWidget(
                  frage: testFrage2,
                  nextQuestionFunc: () {
                    _pageController.animateToPage(
                      2,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                FragenWidget(
                  frage: testFrage,
                  nextQuestionFunc: () {
                    _pageController.animateToPage(
                      3,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                BookingView()
              ],
            ),
          ),
          TextButton(
            onPressed: () => showCupertinoDialog(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text(
                  "Möchtest du die Buchung abbrechen?",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                content: Column(
                  children: [
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
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text('Buchung abbrechen'),
                  ),
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Zurück'),
                  )
                ],
              ),
            ),
            child: Text(
              "Buchungsvorgang abbrechen",
            ),
          ),
        ],
      ),
    );
  }
}
