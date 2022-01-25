import 'package:blooddonation/user_data/input_fields_widget.dart';
import 'package:blooddonation/user_data/last_blood_donation_widget.dart';
import 'package:flutter/material.dart';

class UserDataView extends StatelessWidget {
  const UserDataView({Key? key}) : super(key: key);

  ///Build method for the User Data Screen
  ///
  ///returns [Widget] specifically [Scaffold]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(AppLocalizations.of(context)!.appTitle),
        title: const Text("Nutzerdaten"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            children: const [
              SizedBox(height: 10),
              InputFields(),
              LastBloodDonation(),
            ],
          ),
        ],
      ),
    );
  }
}
