import 'package:blooddonation/providers.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BookingOverview extends ConsumerStatefulWidget {
  const BookingOverview({Key? key}) : super(key: key);

  @override
  _BookingOverviewState createState() => _BookingOverviewState();
}

class _BookingOverviewState extends ConsumerState<BookingOverview> {
  final DateTime earliestDonationBirthday = DateTime.fromMillisecondsSinceEpoch(
      DateTime.now().millisecondsSinceEpoch - 568036800000);

  late TextEditingController _birthdayController;

  @override
  void initState() {
    super.initState();

    _birthdayController = TextEditingController();
    _birthdayController.text = UserService.instance.birthdayAsString;
  }

  @override
  void dispose() {
    _birthdayController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ref.read(bookingStateProvider.state).state--;

        return false;
      },
      child: Column(
        children: [
          CupertinoFormSection.insetGrouped(
            header: const Text("Deine Daten"),
            footer: const Divider(),
            margin: const EdgeInsets.all(12),
            children: [
              CupertinoFormRow(
                prefix: const Text("Name"),
                child: CupertinoTextFormFieldRow(
                  placeholder: "Dein Name",
                  initialValue: UserService.instance.name,
                  onChanged: (value) => UserService.instance.name = value,
                ),
              ),
              CupertinoFormRow(
                prefix: const Text("Geburtsdatum"),
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
                        child: const Text("Fertig"),
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
            header: const Text("Dein Termin"),
            margin: const EdgeInsets.all(12),
            children: [
              CupertinoFormRow(
                prefix: const Text("Termin"),
                child: CupertinoTextFormFieldRow(
                  placeholder: "Dein Termin",
                  initialValue: DateFormat("dd.MM.yyyy 'um' HH:mm").format(
                      BookingService.instance.selectedAppointment!.start),
                  readOnly: true,
                  onTap: () => showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text(
                        "Blutspendetermin",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      content: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            DateFormat("dd.MM.yyyy 'um' HH:mm")
                                .format(BookingService.instance.selectedDay),
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const Text(
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

                            ref.read(bookingStateProvider.state).state = 0;

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
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            child: CupertinoButton.filled(
              child: const Text("Termin buchen"),
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
