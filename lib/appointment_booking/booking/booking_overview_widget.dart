import 'package:blooddonation/models/appointment_model.dart';
import 'package:blooddonation/models/person_model.dart';
import 'package:blooddonation/services/provider/providers.dart';
import 'package:blooddonation/services/backend/backend_service.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

///Class to define the booking overview widget.
///
///Inputs are not required.
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

  ///Function is called when [_BookingOverviewState] is initialized.
  ///
  ///Initializes [_birthdayController], by accessing [UserService].
  @override
  void initState() {
    super.initState();

    _birthdayController = TextEditingController();
    _birthdayController.text = UserService().birthdayAsString;
  }

  ///Function is called when [_BookingOverviewState] is disposed.
  ///
  ///Disposes [_birthdayController]
  @override
  void dispose() {
    _birthdayController.dispose();

    super.dispose();
  }

  ///Build method for the booking overview.
  ///
  ///Returns a [Widget].
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
            header: const Text("Ihre Daten"),
            footer: const Divider(),
            margin: const EdgeInsets.all(12),
            children: [
              CupertinoFormRow(
                prefix: const Text("Name"),
                child: CupertinoTextFormFieldRow(
                  placeholder: "Ihr Name",
                  initialValue: UserService().name,
                  onChanged: (value) => UserService().name = value,
                ),
              ),
              CupertinoFormRow(
                prefix: const Text("Geburtsdatum"),
                child: CupertinoTextFormFieldRow(
                  placeholder: "Ihr Geburtsdatum",
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
                        child: const Text("Fertig"),
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
            header: const Text("Ihr Termin"),
            margin: const EdgeInsets.all(12),
            children: [
              CupertinoFormRow(
                prefix: const Text("Termin"),
                child: CupertinoTextFormFieldRow(
                  placeholder: "Ihr Termin",
                  initialValue: DateFormat("dd.MM.yyyy 'um' HH:mm").format(BookingService().selectedAppointment!.start),
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
                            DateFormat("dd.MM.yyyy 'um' HH:mm").format(BookingService().selectedDay!),
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            "ist Ihr ausgewählter Termin. Möchten Sie Ihren Termin ändern und den Buchungsvorgang noch einmal starten?",
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
                            BookingService().resetBookingProcess();

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
            child: CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: const Text("Termin buchen"),
              onPressed: () async {
                print("Termin buchen button pressed");

                http.Response response = await BackendService().bookAppointment(
                  Appointment(
                    id: "-1",
                    start: DateTime.now(),
                    duration: const Duration(hours: 1),
                    person: Person(
                      birthday: UserService().birthday,
                      gender: UserService().gender,
                      name: UserService().name,
                    ),
                  ),
                );

                if (response.statusCode != 200) {
                  //error
                  //return;
                }

                //BookingService().bookedAppointment = Appointment.fromJson(jsonDecode(response.body));

                BookingService().bookedAppointment = EmptyAppointment();

                Navigator.pop(context); //Reload required at home page
              },
            ),
          ),
        ],
      ),
    );
  }
}
