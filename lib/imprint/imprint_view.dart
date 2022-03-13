import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ImprintView extends StatelessWidget {
  const ImprintView({Key? key}) : super(key: key);

  ///Build method to show the user imprint information and licenses utilized by the application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.imprintHeader),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(12),
        children: [
          Text(
            (AppLocalizations.of(context)!.imprintInformationOfPublisher),
            style: _headTextStyle,
          ),
          const SizedBox(height: 10),
          SelectableText(
            (AppLocalizations.of(context)!.imprintPublisherInformation),
            style: _bodyTextStyle,
          ),
          const SizedBox(height: 30),
          Text(
            (AppLocalizations.of(context)!.imprintContact),
            style: _headTextStyle,
          ),
          const SizedBox(height: 10),
          SelectableText(
            (AppLocalizations.of(context)!.imprintContactInstitution),
            style: _bodyTextStyle,
          ),
          SelectableText(
            (AppLocalizations.of(context)!.imprintContactAdress),
            style: _bodyTextStyle,
          ),
          const SizedBox(height: 30),
          Text(
            (AppLocalizations.of(context)!.imprintLicenses),
            style: _headTextStyle,
          ),
          const SizedBox(height: 10),
          SelectableText(
            (AppLocalizations.of(context)!.imprintLicensesOpenStreetMap),
            style: _bodyTextStyle,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              onPressed: () => showAboutDialog(
                context: context,
                applicationIcon: const Image(
                  width: 50,
                  image: AssetImage("assets/images/logo_square.png"),
                ),
                applicationVersion: "0.3",
                applicationName: (AppLocalizations.of(context)!.appTitle),
                children: [
                  const Image(
                    //width: 50,
                    image: AssetImage("assets/images/logo_transparent.png"),
                  ),
                ],
              ),
              child: Text(
                (AppLocalizations.of(context)!.imprintMoreInformation),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const TextStyle _headTextStyle = TextStyle(color: Colors.black, fontSize: 23.0);
const TextStyle _bodyTextStyle = TextStyle(color: Colors.black, fontSize: 18.0);
