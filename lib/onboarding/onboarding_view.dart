import 'dart:io';

import 'package:blooddonation/onboarding/pages/covid_page.dart';
import 'package:blooddonation/onboarding/pages/didyouknow_page.dart';
import 'package:blooddonation/onboarding/pages/motivation_page.dart';
import 'package:blooddonation/onboarding/pages/welcome_page.dart';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:rive/rive.dart';

/// This is supposed to be an introductionscreen ("Welcome") that greets you when you start the app,
/// so that the app does not simply start with all its functions
class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  SMINumber? _inputPage;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, "state_machine");
    artboard.addController(controller!);
    _inputPage = controller.findInput<double>('page') as SMINumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 50),
              child: RiveAnimation.asset(
                "assets/images/blood_drop.riv",
                fit: BoxFit.fitHeight,
                stateMachines: const ["state_machine"],
                onInit: _onRiveInit,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: IntroductionScreen(
              pages: [
                welcomePage(),
                didyouknowPage(),
                motivationPage(),
                if(Platform.isIOS)
                
                covidPage(context),
              ],
              onChange: (value) {
                _inputPage?.value = value.toDouble();
              },
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
          ),
        ],
      ),
    );
  }
}
