import 'package:blooddonation/app.dart';
import 'package:blooddonation/services/backend/requests/book_appointment.dart';
import 'package:blooddonation/services/provider/providers.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///Class to define the booking overview widget.
class BookingOverview extends ConsumerStatefulWidget {
  const BookingOverview({Key? key}) : super(key: key);

  @override
  _BookingOverviewState createState() => _BookingOverviewState();
}

class _BookingOverviewState extends ConsumerState<BookingOverview> {
  ///Defines the earliest date, where the user is a minimum of 18 years old
  final DateTime earliestDonationBirthday = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch - 568036800000);

  ///Controller for the birthday input field.
  late TextEditingController _birthdayController;

  ///Initializes [_birthdayController], by accessing [UserService].
  @override
  void initState() {
    super.initState();

    _birthdayController = TextEditingController();
    _birthdayController.text = UserService().birthdayAsString;
  }

  ///Function is called when [_BookingOverviewState] is disposed.
  @override
  void dispose() {
    _birthdayController.dispose();

    super.dispose();
  }

  ///Build method for the booking overview.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoFormSection.insetGrouped(
          header: Text(AppLocalizations.of(context)!.homeMenuUserData),
          footer: const Divider(),
          margin: const EdgeInsets.all(12),
          children: [
            CupertinoFormRow(
              prefix: Text(AppLocalizations.of(context)!.name),
              child: CupertinoTextFormFieldRow(
                placeholder: AppLocalizations.of(context)!.yourName,
                initialValue: UserService().name,
                onChanged: (value) => UserService().name = value,
              ),
            ),
            CupertinoFormRow(
              prefix: Text(AppLocalizations.of(context)!.birthday),
              child: CupertinoTextFormFieldRow(
                placeholder: AppLocalizations.of(context)!.yourBirthday,
                readOnly: true,
                controller: _birthdayController,
                onTap: () => showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) => CupertinoActionSheet(
                    actions: [
                      SizedBox(
                        height: 220,
                        child: CupertinoDatePicker(
                          initialDateTime: earliestDonationBirthday,
                          maximumDate: earliestDonationBirthday,
                          mode: CupertinoDatePickerMode.date,
                          dateOrder: DatePickerDateOrder.dmy,
                          onDateTimeChanged: (DateTime dateTime) => UserService().birthday = dateTime,
                        ),
                      ),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      child: Text(AppLocalizations.of(context)!.doneButton),
                      onPressed: () {
                        _birthdayController.text = UserService().birthdayAsString;

                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
            ),
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
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    content: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          DateFormat("dd.MM.yyyy 'um' HH:mm").format(BookingService().selectedDay!),
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.bookingBreakText,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    actions: [
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          //reset
                          BookingService().resetBookingProcess();

                          ref.read(bookingStateProvider.state).state = 0;

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
              print("Book date button has been pressed");

              Appointment appointmentToBook = BookingService().selectedAppointment!.copyWith(
                    //id: 133,
                    person: Person(
                      birthday: UserService().birthday,
                      //gender: UserService().gender,
                      gender: "male",
                      name: UserService().name,
                      telephoneNumber: "1",
                    ),
                  );

              bookAppointment(appointment: appointmentToBook).then((succsess) {
                print(succsess);
                /*if (!succsess) {
                  print("Something went wrong!");
                  return;
                }*/

                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const App(initalPageIndex: 1)), (route) => false);
              });
            },
          ),
        ),
      ],
    );
  }
}
