import 'package:blooddonation/appointment_booking/booking/booking_view.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FirstBooking extends StatefulWidget {
  const FirstBooking({Key? key}) : super(key: key);

  @override
  _FirstBookingState createState() => _FirstBookingState();
}

class _FirstBookingState extends State<FirstBooking> {
  ///Controller for the birthday input field on the page
  late TextEditingController _birthdayController;

  ///Is true, when the next button is pressed. It is used to validate the birthday.
  bool tappedBirthday = false;

  ///Is called, when the Widget is initialized. The [_birthdayController] is started.
  @override
  void initState() {
    super.initState();

    _birthdayController = TextEditingController();
  }

  ///Is called, when the Widget is disposed. The [_birthdayController] is deleted.
  @override
  void dispose() {
    _birthdayController.dispose();

    super.dispose();
  }

  ///Build method to build the booking page, given the user hasn't already input his birthday.
  ///
  ///Returns a [Widget] tree.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ihre erste Blutspende"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 14,
              bottom: 40,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Wann wurden Sie geboren?",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          CupertinoFormSection.insetGrouped(
            header: const Text("Altersabfrage"),
            margin: const EdgeInsets.all(12),
            children: [
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
                            initialDateTime: DateTime.now(),
                            maximumDate: DateTime.now(),
                            mode: CupertinoDatePickerMode.date,
                            dateOrder: DatePickerDateOrder.dmy,
                            onDateTimeChanged: (DateTime dateTime) => UserService.instance.birthday = dateTime,
                          ),
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: const Text("Fertig"),
                        onPressed: () {
                          tappedBirthday = true;
                          _birthdayController.text = UserService.instance.birthdayAsString;
                          setState(() {});
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          birthdayValidation() || !tappedBirthday
              ? Container()
              : const Text(
                  "Sie müssen mindestens 18 Jahre alt sein, um Blut spenden zu können!",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            child: CupertinoButton.filled(
              onPressed: birthdayValidation()
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BookingView()),
                      );
                    }
                  : null,
              child: const Text("Weiter"),
            ),
          ),
        ],
      ),
    );
  }

  ///Validates, whether the given Birthday fits to the expected values (older than 18).
  ///
  ///Returns [bool]. True, if the Birthday isn't empty nor too early (younger than 18).
  bool birthdayValidation() {
    if (UserService.instance.birthday == null) return false;

    DateTime userBirthday = UserService.instance.birthday!;
    DateTime earliestDonationBirthday = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch - 568036800000);

    if (UserService.instance.birthdayAsString == "") return false;
    if (userBirthday.isAfter(earliestDonationBirthday)) return false;

    return true;
  }
}
