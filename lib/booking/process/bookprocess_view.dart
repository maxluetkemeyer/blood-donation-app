import 'package:blooddonation/app.dart';
import 'package:blooddonation/booking/process/parts/booking_overview/booking_overview_widget.dart';
import 'package:blooddonation/booking/process/parts/choose_day/choose_day_widget.dart';
import 'package:blooddonation/booking/process/parts/choose_time/choose_time_widget.dart';
import 'package:blooddonation/booking/process/parts/donation_questions/questions_view.dart';
import 'package:blooddonation/misc/appbar.dart';
import 'package:blooddonation/services/provider/providers.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:im_stepper/stepper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///Class to define the appointment booking process.
class BookProcessView extends ConsumerWidget {
  const BookProcessView({Key? key}) : super(key: key);

  ///Build method to build the Frame for the booking process, including an [IconStepper], to show the current
  ///slide and screen information.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int activeStep = ref.watch(bookingStateProvider.state).state;
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        if (activeStep == 0) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const App(initalPageIndex: 1)), (route) => false);
          return false;
        }

        ref.read(bookingStateProvider.state).state--;
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Termin buchen"),
          actions: const [AppBarMenuButton()],
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
                          _stepperHeader(activeStep, context),
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
                    title: Text(
                      AppLocalizations.of(context)!.bookingStopBooking,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    content: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          AppLocalizations.of(context)!.bookingProgressLoss,
                          style: const TextStyle(
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
                          BookingService().resetProcess();

                          //Goto Home Screen
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const App(initalPageIndex: 1)), (route) => false);
                        },
                        //child: const Text('Cancel Booking'),
                        child: Text(AppLocalizations.of(context)!.bookingStopBooking),
                      ),
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        onPressed: () => Navigator.pop(context),
                        //child: const Text('Back'),
                        child: Text(AppLocalizations.of(context)!.back),
                      )
                    ],
                  ),
                ),
                //child: const Text("Cancel Booking"),
                child: Text(
                  AppLocalizations.of(context)!.bookingStopBooking,
                  style: const TextStyle(color: Color(0xff0b4874)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///Function to show the current slide header.
  String _stepperHeader(int activeStep, BuildContext context) {
    switch (activeStep) {
      case 0:
        return AppLocalizations.of(context)!.bookingChooseDayTitle;
      case 1:
        return AppLocalizations.of(context)!.bookingChooseTimeTitle;
      case 2:
        return AppLocalizations.of(context)!.bookingAnswerQuestionsTitle;
      case 3:
        return AppLocalizations.of(context)!.bookingDatenTitle;
      default:
        return "";
    }
  }

  ///Function to show the current slide body.
  Widget _stepperBody(int activeStep) {
    switch (activeStep) {
      case 0:
        return const ChooseDay();
      case 1:
        return const ChooseTime();
      case 2:
        return const QuestionsView();
      case 3:
        return BookingOverview();
      default:
        return Container();
    }
  }
}
