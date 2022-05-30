import 'package:blooddonation/booking/process/bookprocess_view.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstBooking extends StatefulWidget {
  const FirstBooking({Key? key}) : super(key: key);

  @override
  State<FirstBooking> createState() => _FirstBookingState();
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
        title: Text(AppLocalizations.of(context)!.bookingFirstPrompt),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 14,
              bottom: 40,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.bookingFirstAge,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          CupertinoFormSection.insetGrouped(
            header: Text(AppLocalizations.of(context)!.ageQuestion),
            margin: const EdgeInsets.all(12),
            children: [
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
                            initialDateTime: DateTime.now(),
                            maximumDate: DateTime.now(),
                            mode: CupertinoDatePickerMode.date,
                            dateOrder: DatePickerDateOrder.dmy,
                            onDateTimeChanged: (DateTime dateTime) => UserService().birthday = dateTime,
                          ),
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: Text(AppLocalizations.of(context)!.doneButton),
                        onPressed: () {
                          tappedBirthday = true;
                          _birthdayController.text = UserService().birthdayAsString;
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
              : Text(
                  AppLocalizations.of(context)!.bookingAgeWarning,
                  style: const TextStyle(
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
                        MaterialPageRoute(builder: (context) => const BookProcessView()),
                      );
                    }
                  : null,
              child: Text(AppLocalizations.of(context)!.next),
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
    if (UserService().birthday == null) return false;

    DateTime userBirthday = UserService().birthday!;
    DateTime earliestDonationBirthday = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch - 568036800000);
    DateTime latestDonationBirthday = DateTime.now().add(const Duration(days: -365 * 68));

    if (UserService().birthdayAsString == "") return false;
    if (userBirthday.isAfter(earliestDonationBirthday)) return false;
    if (userBirthday.isBefore(latestDonationBirthday)) return false;

    return true;
  }
}
