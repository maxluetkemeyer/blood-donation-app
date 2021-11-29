import 'package:blooddonation/appointment_booking/booking/booking_view.dart';
import 'package:blooddonation/appointment_booking/firstbooking_view.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookingStartView extends StatelessWidget {
  const BookingStartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ListView(physics: const BouncingScrollPhysics(), children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 60,
                bottom: 40,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.bookingStartHeader,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Text(
              AppLocalizations.of(context)!.bookingStartInfo,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              child: CupertinoButton.filled(
                child: Text(AppLocalizations.of(context)!.bookingStartButton),
                onPressed: () async {
                  if (UserService.instance.birthdayAsString == "") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FirstBooking()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BookingView()),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 40),
            // ignore: sized_box_for_whitespace
            Container(
              width: width * 0.6,
              height: height * 0.3,
              child: const Placeholder(),
            ),
          ],
        ),
      ),
    ]);
  }
}
