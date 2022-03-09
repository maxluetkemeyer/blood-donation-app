import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../style.dart';

PageViewModel didyouknowPage(BuildContext context) => PageViewModel(
      title: AppLocalizations.of(context)!.onboarding2Title,
      bodyWidget: Text(
        AppLocalizations.of(context)!.onboarding2Body,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.justify,
      ),
      /*footer: Link(
        uri: Uri.parse('https://ukm-blutspende.de/index.php?id=wussten-sie'),
        builder: (context, followLink) => GestureDetector(
          onTap: followLink,
          child: const Text(
            "Mehr Informationen finden Sie hier",
            style: TextStyle(fontSize: 15, decoration: TextDecoration.underline),
          ),
        ),
        target: LinkTarget.self,
      ),*/
      decoration: getOwnPageDecoration(),
    );
