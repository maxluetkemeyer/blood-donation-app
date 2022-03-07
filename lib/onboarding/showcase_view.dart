import 'package:blooddonation/app.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class OnboardingShowcase extends StatelessWidget {
  const OnboardingShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(
        builder: (context) => const App(),
      ),
    );
  }
}
