import 'package:blooddonation/providers.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseTime extends StatelessWidget {
  const ChooseTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read(bookingStateProvider).state--;

        return false;
      },
      child: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: BookingService.instance.appointmentBoxList(),
        ),
      ),
    );
  }
}
