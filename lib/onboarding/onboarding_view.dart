import 'package:blooddonation/onboarding/pages/covid_page.dart';
import 'package:blooddonation/onboarding/pages/didyouknow_page.dart';
import 'package:blooddonation/onboarding/pages/motivation_page.dart';
import 'package:blooddonation/onboarding/pages/welcome_page.dart';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

/// This is supposed to be an introductionscreen ("Welcome") that greets you when you start the app,
/// so that the app does not simply start with all its functions
class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          welcomePage(),
          didyouknowPage(),
          motivationPage(),
          covidPage(context),
        ],
        showDoneButton: false,
        showSkipButton: false,
        next: Icon(
          Icons.arrow_forward_ios,
          color: Theme.of(context).primaryColor,
        ),
        dotsDecorator: DotsDecorator(
          color: const Color(0xff003866),
          size: const Size(5, 5),
          activeSize: const Size(11, 5),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          activeColor: const Color(0xff003866),
        ),
      ),
    );
  }
}
