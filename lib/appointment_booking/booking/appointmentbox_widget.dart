import 'package:blooddonation/services/booking/appointment_model.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';

class AppointmentBox extends ConsumerWidget {
  final Appointment appointment;

  const AppointmentBox({
    Key? key,
    required this.appointment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    return CupertinoButton.filled(
      padding: EdgeInsets.symmetric(horizontal: width * 0.09),
      onPressed: () {
        BookingService.instance.selectedAppointment = appointment;
        ref.read(bookingStateProvider.state).state++;
      },
      child: Text(
        ((appointment.start.hour.toString().length == 1)
                ? "0" + appointment.start.hour.toString()
                : appointment.start.hour.toString()) +
            ":" +
            ((appointment.start.minute.toString().length == 1)
                ? "0" + appointment.start.minute.toString()
                : appointment.start.minute.toString()),
      ),
    );
  }
}
