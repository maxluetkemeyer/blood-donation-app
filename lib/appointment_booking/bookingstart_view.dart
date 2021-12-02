import 'package:blooddonation/appointment_booking/booking/booking_view.dart';
import 'package:blooddonation/appointment_booking/booking_appointment_booked.dart';
import 'package:blooddonation/appointment_booking/firstbooking_view.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookingStartView extends StatelessWidget {
  const BookingStartView({Key? key}) : super(key: key);

  ///Build method to build the booking page. Here, the user can access the booking process.
  ///
  ///Returns a [Widget] tree.
  @override
  Widget build(BuildContext context) {
    ///The width of the ported media
    double width = MediaQuery.of(context).size.width;

    ///The height of the ported media
    double height = MediaQuery.of(context).size.height;

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        BookingService.instance.bookedAppointment != null
            ? AppointmentBookedView()
            : Padding(
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
                    Container(
                      margin: const EdgeInsets.only(top: 32, left: 12, right: 12),
                      width: double.infinity,
                      child: CupertinoButton(
                        color: Theme.of(context).primaryColor,
                        child: Text(AppLocalizations.of(context)!.bookingStartButton),
                        onPressed: () async {
                          if (UserService.instance.birthdayAsString == "") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const FirstBooking()),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const BookingView()),
                            );
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 40, bottom: 40),
                      width: width * 0.6,
                      height: height * 0.3,
                      child: const Placeholder(),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
