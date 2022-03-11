import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BirthdayField extends StatefulWidget {
  const BirthdayField({Key? key}) : super(key: key);

  @override
  State<BirthdayField> createState() => _BirthdayFieldState();
}

class _BirthdayFieldState extends State<BirthdayField> {
  late TextEditingController controller;

  ///Is the earliest possible donor birthday to input into the bearthday selection
  final DateTime earliestDonationBirthday = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch - 568036800000);

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: UserService().birthdayAsString);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      key: const ValueKey("birthdayField"),
      prefix: Text(AppLocalizations.of(context)!.birthday),
      child: CupertinoTextFormFieldRow(
        placeholder: AppLocalizations.of(context)!.yourBirthday,
        readOnly: true,
        controller: controller,
        onTap: () => showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) => CupertinoActionSheet(
            actions: [
              SizedBox(
                height: 250,
                child: CupertinoDatePicker(
                  initialDateTime: UserService().birthdayAsString == "" ? earliestDonationBirthday : UserService().birthday,
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
                controller.text = UserService().birthdayAsString;

                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
