import 'package:blooddonation/providers.dart';
import 'package:blooddonation/services/booking/appointment_model.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'appointmentbox_widget.dart';

class ChooseTime extends ConsumerWidget {
  const ChooseTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        ref.read(bookingStateProvider.state).state--;

        return false;
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: _appointmentBoxList(),
        ),
      ),
    );
  }

  List<Widget> _appointmentBoxList() {
    DateTime selectedDay = BookingService.instance.selectedDay;
    List<Appointment> freeAppointments =
        BookingService.instance.freeAppointments;

    List<Widget> boxes = [];
    List freeAppointmentsAtThisDay = [];

    DateTime day =
        DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
    DateTime nextDay = day.add(const Duration(hours: 23, minutes: 59));

    for (Appointment app in freeAppointments) {
      if ((app.start.isAfter(day) || app.start.isAtSameMomentAs(day)) &&
          app.start.isBefore(nextDay)) {
        freeAppointmentsAtThisDay.add(app);
      }
    }

    for (Appointment app in freeAppointmentsAtThisDay) {
      AppointmentBox box = AppointmentBox(
        appointment: app,
      );
      boxes.add(box);
    }

    return boxes;
  }
}
