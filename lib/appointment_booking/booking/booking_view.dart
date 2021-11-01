import 'package:blooddonation/appointment_booking/booking/booking_overview_widget.dart';
import 'package:blooddonation/appointment_booking/booking/choose_day_widget.dart';
import 'package:blooddonation/appointment_booking/booking/choose_time_widget.dart';
import 'package:blooddonation/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:im_stepper/stepper.dart';

class BookingView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    int activeStep = watch(bookingStateProvider).state;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            child: IconStepper(
              direction: Axis.horizontal,
              enableNextPreviousButtons: false,
              activeStep: activeStep,
              activeStepColor: Theme.of(context).primaryColor,
              activeStepBorderWidth: 6,
              stepRadius: 30,
              activeStepBorderPadding: 0,
              lineDotRadius: 1.4,
              lineLength: width * 0.2,
              icons: [
                Icon(
                  Icons.date_range_rounded,
                  color: Colors.white,
                  size: 3,
                ),
                Icon(Icons.access_time_filled, color: Colors.white),
                Icon(Icons.send, color: Colors.white),
              ],
              enableStepTapping: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 10,
              bottom: 40,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _stepperHeader(activeStep),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          _stepperBody(activeStep),
        ],
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
        return "Daten überprüfen";
      default:
        return "";
    }
  }

  Widget _stepperBody(activeStep) {
    switch (activeStep) {
      case 0:
        return ChooseDay();
      case 1:
        return ChooseTime();
      case 2:
        return BookingOverview();
      default:
        return Container();
    }
  }
}
