import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../style.dart';

// Welcomepage
PageViewModel welcomePage(BuildContext context) => PageViewModel(
      title: AppLocalizations.of(context)!.onboarding1Title,
      body: AppLocalizations.of(context)!.onboarding1Body,
      decoration: getOwnPageDecoration(),
    );
