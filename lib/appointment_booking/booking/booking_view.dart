import 'package:blooddonation/appointment_booking/booking/booking_overview_widget.dart';
import 'package:blooddonation/appointment_booking/booking/choose_day_widget.dart';
import 'package:blooddonation/appointment_booking/booking/choose_time_widget.dart';
import 'package:blooddonation/appointment_booking/questions/questions_view.dart';
import 'package:blooddonation/services/provider/providers.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:im_stepper/stepper.dart';

///Class to define the appointment booking process.
///
///Widget requires no Input
class BookingView extends ConsumerWidget {
  const BookingView({Key? key}) : super(key: key);

  ///Build method to build the Frame for the booking process, including an [IconStepper], to show the current
  ///slide and screen information.
  ///
  ///Returns a [Widget] tree.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int activeStep = ref.watch(bookingStateProvider.state).state;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(_stepperHeader(activeStep)),
      ),
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 14,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  IconStepper(
                    stepColor: Theme.of(context).colorScheme.onBackground,
                    direction: Axis.horizontal,
                    enableNextPreviousButtons: false,
                    activeStep: activeStep,
                    activeStepColor: Theme.of(context).primaryColor,
                    activeStepBorderWidth: 6,
                    stepRadius: 28,
                    activeStepBorderPadding: 0,
                    lineDotRadius: 1.4,
                    lineLength: width * 0.12,
                    activeStepBorderColor: Theme.of(context).primaryColor,
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
              key: const ValueKey('cancelBooking'),
              onPressed: () => showCupertinoDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text(
                    "Möchten Sie die Buchung abbrechen?",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  content: Column(
                    children: const [
                      SizedBox(height: 10),
                      Text(
                        "Ihr bisheriger Fortschritt geht verloren.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  actions: [
                    CupertinoDialogAction(
                      key: const ValueKey('cancelBookingComp'),
                      isDestructiveAction: true,
                      onPressed: () {
                        //reset booking process
                        BookingService().resetBookingProcess();
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
              child: const Text(
                "Buchungsvorgang abbrechen",
                style: TextStyle(color: Color(0xff0b4874)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///Function to show the current slide header.
  ///
  ///Input requires [activeStep] as [int] operator.
  ///
  ///Returns type [String].
  String _stepperHeader(activeStep) {
    switch (activeStep) {
      case 0:
        return "Tag auswählen";
      case 1:
        return "Verfügbare Zeiten";
      case 2:
        return "Dürfen Sie Blut spenden?";
      case 3:
        return "Daten überprüfen";
      default:
        return "";
    }
  }

  ///Function to show the current slide body.
  ///
  ///Input requires [activeStep] as [int] operator.
  ///
  ///Returns type [Widget].
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
