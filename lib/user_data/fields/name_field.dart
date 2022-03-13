import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:blooddonation/services/user/user_service.dart';

class NameField extends StatefulWidget {
  final bool showErrorMessage;

  const NameField({
    Key? key,
    this.showErrorMessage = false,
  }) : super(key: key);

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: UserService().name);
    controller.addListener(() {
      UserService().name = controller.text;
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
      prefix: Text(AppLocalizations.of(context)!.name),
      error: widget.showErrorMessage ? Text(AppLocalizations.of(context)!.userDataErrorMessage) : null,
      child: CupertinoTextFormFieldRow(
        placeholder: AppLocalizations.of(context)!.yourName,
        controller: controller,
      ),
    );
  }
}
