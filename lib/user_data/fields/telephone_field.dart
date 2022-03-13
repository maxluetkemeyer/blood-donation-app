import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:blooddonation/services/user/user_service.dart';

class TelephoneField extends StatefulWidget {
  final bool showErrorMessage;

  const TelephoneField({
    Key? key,
    this.showErrorMessage = false,
  }) : super(key: key);

  @override
  State<TelephoneField> createState() => _TelephoneFieldState();
}

class _TelephoneFieldState extends State<TelephoneField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: UserService().telephoneNumber);

    controller.addListener(() {
      UserService().telephoneNumber = controller.text;
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      prefix: Text(AppLocalizations.of(context)!.userDataTelephone),
      error: widget.showErrorMessage ? Text(AppLocalizations.of(context)!.userDataErrorMessage) : null,
      helper:  Text(
        AppLocalizations.of(context)!.userDataTelephoneReason,
        style: const TextStyle(color: Colors.black26),
      ),
      key: const ValueKey("telephoneField"),
      child: CupertinoTextFormFieldRow(
        placeholder: (AppLocalizations.of(context)!.userDataTelephonePlaceholder),
        controller: controller,
        keyboardType: TextInputType.phone,
      ),
    );
  }
}
