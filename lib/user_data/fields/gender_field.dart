import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:blooddonation/services/user/user_service.dart';

class GenderField extends StatefulWidget {
  final bool showErrorMessage;

  const GenderField({
    Key? key,
    this.showErrorMessage = false,
  }) : super(key: key);

  @override
  State<GenderField> createState() => _GenderFieldState();
}

class _GenderFieldState extends State<GenderField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: UserService().gender);
    controller.addListener(() {
      UserService().gender = controller.text;
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
      prefix: Text(AppLocalizations.of(context)!.userDataGender),
      error: widget.showErrorMessage ? Text(AppLocalizations.of(context)!.userDataErrorMessage) : null,
      child: CupertinoTextFormFieldRow(
        placeholder: (AppLocalizations.of(context)!.userDataGenderPlaceholder),
        controller: controller,
      ),
    );
  }
}
