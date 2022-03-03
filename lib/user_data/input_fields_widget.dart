import 'package:blooddonation/services/user/user_service.dart';
import 'package:blooddonation/user_data/fields/birthday_field.dart';
import 'package:blooddonation/user_data/fields/firstdonation_field.dart';
import 'package:blooddonation/user_data/fields/gender_field.dart';
import 'package:blooddonation/user_data/fields/name_field.dart';
import 'package:blooddonation/user_data/fields/telephone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///Create a [CupertinoFormSection] where the user can input the name and birthday,
///if the user hasn't already input the data during the booking process. In case the user has already
///input the data before, the data can be seen inside the Input fields via [UserService].
class InputFields extends StatelessWidget {
  const InputFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection.insetGrouped(
      header: Text(AppLocalizations.of(context)!.userDataDataHeading),
      footer: const Divider(),
      margin: const EdgeInsets.all(12),
      children: const [
        NameField(),
        BirthdayField(),
        GenderField(),
        TelephoneField(),
        FirstDonationField(),
      ],
    );
  }
}
