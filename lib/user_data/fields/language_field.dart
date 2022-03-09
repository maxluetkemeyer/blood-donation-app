import 'package:blooddonation/services/faq/faq_service.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:language_picker/languages.dart';

class LanguageField extends StatefulWidget {
  const LanguageField({Key? key}) : super(key: key);

  @override
  State<LanguageField> createState() => _LanguageFieldState();
}

class _LanguageFieldState extends State<LanguageField> {
  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      prefix: const Text("Sprache"),
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          value: UserService().language.isoCode,
          items: [
            for (Language lan in FaqService().extractLanguages())
              DropdownMenuItem(
                value: lan.isoCode,
                child: Text(lan.name),
              ),
          ],
          onChanged: (isoCode) {
            if (isoCode == null) return;

            setState(() {
              UserService().language = Language.fromIsoCode(isoCode);
            });
          },
        ),
      ),
    );
  }
}
