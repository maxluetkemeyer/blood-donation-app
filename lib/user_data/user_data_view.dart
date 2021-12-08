import 'package:blooddonation/user_data/input_fields_widget.dart';
import 'package:blooddonation/user_data/last_blood_donation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserDataView extends StatelessWidget {
  const UserDataView({Key? key}) : super(key: key);

  ///Build method for the User Data Screen
  ///
  ///returns [Widget] specifically [Scaffold]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 10,
                  bottom: 40,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.userDataHeading,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const InputFields(),
              const LastBloodDonation(),
            ],
          ),
        ],
      ),
    );
  }
}
