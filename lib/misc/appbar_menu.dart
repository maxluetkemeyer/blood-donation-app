import 'package:blooddonation/app.dart';
import 'package:blooddonation/imprint/imprint_view.dart';
import 'package:blooddonation/user_data/user_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppBarMenuButton extends StatelessWidget {
  const AppBarMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      elevation: 14,
      onSelected: (value) {
        switch (value) {
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (context) => const UserDataView()));
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ImprintView()));
            break;
          case 2:
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const App(showShowcase: true)), (Route<dynamic> route) => false);
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          textStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          child: Text(AppLocalizations.of(context)!.homeMenuUserData),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: 1,
          textStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          child: Text(AppLocalizations.of(context)!.homeMenuImprint),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: 2,
          textStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          child: const Text("Hilfe"),
        ),
      ],
    );
  }
}
