import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GenderField extends StatefulWidget {
  const GenderField({Key? key}) : super(key: key);

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
      prefix: const Text("Gender"),
      child: CupertinoTextFormFieldRow(
        placeholder: "Your Gender",
        controller: controller,
      ),
    );
  }
}
