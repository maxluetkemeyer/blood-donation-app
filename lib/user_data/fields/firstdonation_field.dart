import 'package:blooddonation/services/user/user_service.dart';
import 'package:flutter/cupertino.dart';

class FirstDonationField extends StatefulWidget {
  const FirstDonationField({Key? key}) : super(key: key);

  @override
  State<FirstDonationField> createState() => _FirstDonationFieldState();
}

class _FirstDonationFieldState extends State<FirstDonationField> {
  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      prefix: const Text("First Donation"),
      child: CupertinoSwitch(
        value: UserService().firstDonation,
        onChanged: (value) => setState(() {
          UserService().firstDonation = value;
        }),
      ),
    );
  }
}
