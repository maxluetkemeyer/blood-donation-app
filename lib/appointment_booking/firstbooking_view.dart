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
  late TextEditingController _birthdayController;
  bool tappedBirthday = false;

  @override
  void initState() {
    super.initState();

    _birthdayController = TextEditingController();
  }

  @override
  void dispose() {
    _birthdayController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deine erste Blutspende"),
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
                "Wann bist du geboren?",
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
                            initialDateTime: DateTime.now(),
                            maximumDate: DateTime.now(),
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
                          tappedBirthday = true;
                          _birthdayController.text =
                              UserService.instance.birthdayAsString;
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
                  "Du musst mindestens 18. Jahre alt sein, um Blut zu spenden!",
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
                        MaterialPageRoute(
                            builder: (context) => const BookingView()),
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

  bool birthdayValidation() {
    DateTime userBirthday = UserService.instance.birthday;
    DateTime earliestDonationBirthday = DateTime.fromMillisecondsSinceEpoch(
        DateTime.now().millisecondsSinceEpoch - 568036800000);

    if (UserService.instance.birthdayAsString == "") return false;
    if (userBirthday.isAfter(earliestDonationBirthday)) return false;

    return true;
  }
}
