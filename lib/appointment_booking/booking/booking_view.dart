import 'package:blooddonation/appointment_booking/booking/booking_overview_widget.dart';
import 'package:blooddonation/appointment_booking/booking/choose_day_widget.dart';
import 'package:blooddonation/appointment_booking/booking/choose_time_widget.dart';
import 'package:blooddonation/appointment_booking/questions/questions_view.dart';
import 'package:blooddonation/providers.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:im_stepper/stepper.dart';

class BookingView extends ConsumerWidget {
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int activeStep = ref.watch(bookingStateProvider.state).state;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(_stepperHeader(activeStep)),
      ),
      body: FutureBuilder(
        future: BookingService.instance.getFreeAppointments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 14,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      IconStepper(
                        direction: Axis.horizontal,
                        enableNextPreviousButtons: false,
                        activeStep: activeStep,
                        activeStepColor: Theme.of(context).primaryColor,
                        activeStepBorderWidth: 6,
                        stepRadius: 28,
                        activeStepBorderPadding: 0,
                        lineDotRadius: 1.4,
                        lineLength: width * 0.12,
                        icons: const [
                          Icon(
                            Icons.date_range_rounded,
                            color: Colors.white,
                            size: 3,
                          ),
                          Icon(Icons.access_time_filled, color: Colors.white),
                          Icon(Icons.question_answer, color: Colors.white),
                          Icon(Icons.send, color: Colors.white),
                        ],
                        enableStepTapping: false,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 10,
                          bottom: 40,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _stepperHeader(activeStep),
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      _stepperBody(activeStep),
                    ],
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: TextButton(
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
                            ref.read(bookingStateProvider.state).state = 0;

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
              ),
            ],
          );
        },
      ),
    );
  }

  String _stepperHeader(activeStep) {
    switch (activeStep) {
      case 0:
        return "Tag auswählen";
      case 1:
        return "Verfügbare Zeiten";
      case 2:
        return "Darfst du Blutspenden?";
      case 3:
        return "Daten überprüfen";
      default:
        return "";
    }
  }

  Widget _stepperBody(activeStep) {
    switch (activeStep) {
      case 0:
        return const ChooseDay();
      case 1:
        return const ChooseTime();
      case 2:
        return const QuestionsView();
      case 3:
        return const BookingOverview();
      default:
        return Container();
    }
  }
}
