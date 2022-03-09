import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/provider/providers.dart';

///Class to define one Appointment.
///
///Inputs include a required [appointment] from the type [Appointment] to define
///the shown Button itself with the data from [appointment].
class AppointmentBox extends ConsumerWidget {
  final Appointment appointment;
  final int maxSlots;
  final int usedSlots;

  ///Constructor for [AppointmentBox]
  const AppointmentBox({
    Key? key,
    required this.appointment,
    required this.maxSlots,
    required this.usedSlots,
  }) : super(key: key);

  ///Build method for one [AppointmentBox].
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double ratio = (maxSlots - usedSlots) / maxSlots;

    //Color textColor = _lighten(Colors.black, 0.8 * (1 - ratio));
    Color textColor = Colors.black;

    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _lighten(Theme.of(context).primaryColor, 0.9 * ratio),
            Colors.white,
          ],
          stops: const [
            0,
            //0.4,
            1,
          ],
        ),
      ),
      child: InkWell(
        onTap: () {
          BookingService().selectedAppointment = appointment;
          ref.read(bookingStateProvider.state).state++;
        },
        child: ListTile(
          leading: Text(
            DateFormat("HH:mm").format(appointment.start),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          minLeadingWidth: 70,
          title: Text(
            "$usedSlots / $maxSlots Personen",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ),
    );
  }
}

Color _lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}
