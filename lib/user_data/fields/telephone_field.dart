import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TelephoneField extends StatefulWidget {
  const TelephoneField({Key? key}) : super(key: key);

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
      key: const ValueKey("telephoneField"),
      prefix: const Text("Telephone"),
      child: CupertinoTextFormFieldRow(
        placeholder: "Your telephone number",
        controller: controller,
        keyboardType: TextInputType.phone,
      ),
    );
  }
}
