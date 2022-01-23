import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

/// Get uniform decoration for pages in inside [OnboardingView]
PageDecoration getOwnPageDecoration() => PageDecoration(
      titleTextStyle: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xff003866),
      ),
      bodyTextStyle: const TextStyle(fontSize: 20),
      descriptionPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
      imagePadding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
      pageColor: Colors.white,
    );
