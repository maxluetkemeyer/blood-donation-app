import 'package:blooddonation/providers.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BookingOverview extends StatefulWidget {
  @override
  State<BookingOverview> createState() => _BookingOverviewState();
}

class _BookingOverviewState extends State<BookingOverview> {
  final DateTime earliestDonationBirthday = DateTime.fromMillisecondsSinceEpoch(
      DateTime.now().millisecondsSinceEpoch - 568036800000);

  late TextEditingController _birthdayController;

  @override
  void initState() {
    super.initState();

    _birthdayController = TextEditingController();
    _birthdayController.text = UserService.instance.birthdayAsString;
  }

  void dispose() {
    _birthdayController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read(bookingStateProvider).state--;

        return false;
      },
      child: Column(
        children: [
          CupertinoFormSection.insetGrouped(
            header: Text("Deine Daten"),
            footer: Divider(),
            margin: EdgeInsets.all(12),
            children: [
              CupertinoFormRow(
                prefix: Text("Name"),
                child: CupertinoTextFormFieldRow(
                  placeholder: "Dein Name",
                  initialValue: UserService.instance.name,
                  onChanged: (value) => UserService.instance.name = value,
                ),
              ),
              CupertinoFormRow(
                prefix: Text("Geburtsdatum"),
                child: CupertinoTextFormFieldRow(
                  placeholder: "Dein Geburtsdatum",
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
                            onDateTimeChanged: (DateTime dateTime) =>
                                UserService.instance.birthday = dateTime,
                          ),
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: Text("Fertig"),
                        onPressed: () {
                          _birthdayController.text =
                              UserService.instance.birthdayAsString;

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
            header: Text("Dein Termin"),
            margin: EdgeInsets.all(12),
            children: [
              CupertinoFormRow(
                prefix: Text("Termin"),
                child: CupertinoTextFormFieldRow(
                  placeholder: "Dein Termin",
                  initialValue: DateFormat("dd.MM.yyyy 'um' HH:mm")
                      .format(BookingService.instance.selectedDay),
                  readOnly: true,
                  onTap: () => showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: Text(
                        "Blutspendetermin",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      content: Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            DateFormat("dd.MM.yyyy 'um' HH:mm")
                                .format(BookingService.instance.selectedDay),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "ist dein ausgewählter Termin. Möchtest du deinen Termin ändern und die Buchung nochmal starten?",
                            style: TextStyle(
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
                            BookingService.instance.reset();

                            context.read(bookingStateProvider).state = 0;

                            Navigator.pop(context);
                          },
                          child: const Text('Termin ändern'),
                        ),
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Zurück'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            child: CupertinoButton.filled(
              child: Text("Termin buchen"),
              onPressed: () async {
                print("Termin buchen button pressed");

                print(UserService.instance.name);
                print(UserService.instance.birthdayAsString);
                print(BookingService.instance.selectedDay.toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}
