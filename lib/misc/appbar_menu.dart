import 'package:blooddonation/imprint/imprint_view.dart';
import 'package:blooddonation/onboarding/onboarding_view.dart';
import 'package:blooddonation/services/booking/booking_services.dart';
import 'package:blooddonation/services/user/user_service.dart';
import 'package:blooddonation/user_data/user_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:blooddonation/services/background/background_service.dart' as background;

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
            reset();

            Navigator.of(context)
                .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const OnboardingView()), (Route<dynamic> route) => false);
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
          child: Text(AppLocalizations.of(context)!.miscAppbarHelp),
        ),
      ],
    );
  }
}

Future reset() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear().then((value) {
    UserService().reset();
    BookingService().resetProcess();
    BookingService().resetService();
    background.stop();
  });
}
