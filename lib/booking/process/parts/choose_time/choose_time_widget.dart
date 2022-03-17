import 'package:blooddonation/misc/utils.dart';
import 'package:blooddonation/services/backend/backend_service.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:blooddonation/misc/env.dart' as env;

import 'appointmentbox_widget.dart';

///Class to define the time choosing widget.
class ChooseTime extends ConsumerWidget {
  const ChooseTime({Key? key}) : super(key: key);

  ///Build method to build the Widget that allows the user to choose the desired time to donate.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: getFreeAppointments(extractDay(BookingService().selectedAppointment!.start)),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Padding(
          padding: const EdgeInsets.only(top: 30, left: 2, right: 2),
          child: Column(
            children: _appointmentBoxList(),
          ),
        );
      },
    );
  }

  ///Private Function to fetch the [List] of appointment [Widget]s from the [BookingService],
  ///only fetching the data from the current date and creating an [AppointmentBox] for each time.
  List<Widget> _appointmentBoxList() {
    DateTime day = extractDay(BookingService().selectedAppointment!.start);
    DateTime nextDay = day.add(const Duration(days: 1));

    List<Appointment> freeAppointments = BookingService().freeAppointments;

    List<AppointmentBox> tiles = [];
    List freeAppointmentsAtThisDay = [];

    for (Appointment appointment in freeAppointments) {
      if ((appointment.start.isAfter(DateTime.now()) || appointment.start.isAtSameMomentAs(DateTime.now())) && appointment.start.isBefore(nextDay)) {
        freeAppointmentsAtThisDay.add(appointment);
      }
    }

    Map<String, int> map = {};
    Map<String, Appointment> map2 = {};

    for (Appointment app in freeAppointmentsAtThisDay) {
      String key = DateFormat("HH:mm").format(app.start);

      if (map.containsKey(key)) {
        map[key] = map[key]! + 1;
      } else {
        map.addAll({
          key: 1,
        });
        map2[key] = app;
      }
    }

    map.forEach((key, value) {
      tiles.add(
        AppointmentBox(
          appointment: map2[key]!,
          maxSlots: env.MAX_CAPACITY_SLOTS,
          usedSlots: env.MAX_CAPACITY_SLOTS - map[key]!,
          //usedSlots: Random().nextInt(5),
        ),
      );
    });

    return tiles;
  }
}
