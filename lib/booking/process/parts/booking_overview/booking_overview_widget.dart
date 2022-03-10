import 'package:blooddonation/app.dart';
import 'package:blooddonation/misc/utils.dart';
import 'package:blooddonation/services/backend/requests/book_appointment.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:blooddonation/user_data/fields/birthday_field.dart';
import 'package:blooddonation/user_data/fields/gender_field.dart';
import 'package:blooddonation/user_data/fields/name_field.dart';
import 'package:blooddonation/user_data/fields/telephone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:blooddonation/services/background/background_service.dart' as background;

///Class to define the booking overview widget.
class BookingOverview extends StatelessWidget {
  BookingOverview({Key? key}) : super(key: key);

  ///Defines the earliest date, where the user is a minimum of 18 years old
  final DateTime earliestDonationBirthday = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch - 568036800000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoFormSection.insetGrouped(
          header: Text(AppLocalizations.of(context)!.homeMenuUserData),
          footer: const Divider(),
          margin: const EdgeInsets.all(12),
          children: const [
            NameField(),
            BirthdayField(),
            GenderField(),
            TelephoneField(),
          ],
        ),
        CupertinoFormSection.insetGrouped(
          header: Text(AppLocalizations.of(context)!.bookingYourAppointment),
          margin: const EdgeInsets.all(12),
          children: [
            CupertinoFormRow(
              prefix: Text(AppLocalizations.of(context)!.bookingAppointment),
              child: CupertinoTextFormFieldRow(
                placeholder: AppLocalizations.of(context)!.bookingYourAppointment,
                initialValue: DateFormat("dd.MM.yyyy 'um' HH:mm").format(BookingService().selectedAppointment!.start),
                readOnly: true,
                onTap: () => showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    title: Text(
                      AppLocalizations.of(context)!.bookingStartHeader,
                      style: const TextStyle(fontSize: 24),
                    ),
                    content: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          DateFormat("dd.MM.yyyy 'um' HH:mm").format(BookingService().selectedAppointment!.start),
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          AppLocalizations.of(context)!.bookingBreakText,
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    actions: [
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          //reset
                          BookingService().resetProcess();

                          Navigator.pop(context);
                        },
                        child: Text(AppLocalizations.of(context)!.bookingChangeDate),
                      ),
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        onPressed: () => Navigator.pop(context),
                        child: Text(AppLocalizations.of(context)!.back),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
          child: CupertinoButton(
            color: Theme.of(context).primaryColor,
            child: Text(AppLocalizations.of(context)!.bookingStartButton),
            onPressed: () async {
              Appointment appointmentToBook = BookingService().selectedAppointment!.copyWith(
                    person: Person(
                      name: UserService().name,
                      birthday: UserService().birthday,
                      gender: UserService().gender,
                      telephoneNumber: UserService().telephoneNumber,
                      firstDonation: UserService().firstDonation,
                    ),
                  );

              bookAppointment(appointment: appointmentToBook).then((succsess) {
                print(succsess);
                if (!succsess) {
                  print(Text(AppLocalizations.of(context)!.bookingErrorProcessFailure));
                  return;
                }

                UserService().lastDonation = extractDay(BookingService().bookedAppointment!.start);
                UserService().firstDonation = false;

                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const App(initalPageIndex: 1)), (route) => false);

                BookingService().resetProcess();
                background.init().then((_) => background.start());
              });
            },
          ),
        ),
      ],
    );
  }
}
