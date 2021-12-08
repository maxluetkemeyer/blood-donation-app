import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///Create a [CupertinoFormSection] where the user can input the name and birthday,
///if the user hasn't already input the data during the booking process. In case the user has already
///input the data before, the data can be seen inside the Input fields via [UserService].
class InputFields extends StatefulWidget {
  const InputFields({Key? key}) : super(key: key);

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  ///Is used to access either the already saved birthdate or to save a newly input birthdate
  late TextEditingController _birthdayController;

  ///Is the earliest possible donor birthday to input into the bearthday selection
  final DateTime earliestDonationBirthday = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch - 568036800000);

  ///Function is called when [_UserDataViewState] is initialized
  @override
  void initState() {
    super.initState();

    _birthdayController = TextEditingController();
  }

  ///Function is called when [_UserDataViewState] is disposed
  @override
  void dispose() {
    _birthdayController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //the Controller for the birthday is set to the already input birthday.
    _birthdayController.text = UserService.instance.birthdayAsString;

    return CupertinoFormSection.insetGrouped(
      header: Text(AppLocalizations.of(context)!.userDataDataHeading),
      footer: const Divider(),
      margin: const EdgeInsets.all(12),
      children: [
        CupertinoFormRow(
          prefix: Text(AppLocalizations.of(context)!.name),
          child: CupertinoTextFormFieldRow(
            placeholder: AppLocalizations.of(context)!.yourName,
            initialValue: UserService.instance.name,
            onChanged: (value) => setState(() {
              UserService.instance.name = value;
            }),
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
                      onDateTimeChanged: (DateTime dateTime) => UserService.instance.birthday = dateTime,
                    ),
                  ),
                ],
                cancelButton: CupertinoActionSheetAction(
                  child: const Text("Fertig"),
                  onPressed: () {
                    _birthdayController.text = UserService.instance.birthdayAsString;

                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
