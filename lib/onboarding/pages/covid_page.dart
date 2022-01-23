import 'package:blooddonation/app.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../style.dart';

PageViewModel covidPage(BuildContext context) => PageViewModel(
      title: "Aktuelle Informationen zur Blutspende am UKM",
      bodyWidget: const Text(
        "Für alle Blutspender:innen gilt die 3G-Regel.\nDas bedeutet: Zum Blutspende-Termin muss entweder ein Impfnachweis, eine Bescheinigung über Genesung oder ein Antigen-Schnelltest (nicht älter als 48 Std.) vorgelegt werden.",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, wordSpacing: 3),
        textAlign: TextAlign.center,
      ),
      image: const RiveAnimation.asset("images/blood_drop.riv"),
      decoration: getOwnPageDecoration(),
      footer: ElevatedButton(
        onPressed: () => goToHomeScreen(context),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: const BorderSide(color: Color(0xff003866), width: 2.0))),
            backgroundColor: MaterialStateProperty.all(const Color(0xff003866))),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 100, minHeight: 25),
          alignment: Alignment.center,
          child: const Text(
            "Starte App",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );

///Method to go to the homescreen if button was clicked. Sets "alreadyOnboarded" inside [SharedPreferences] to true
void goToHomeScreen(BuildContext context) async {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const AppStructure(),
      ),
      (Route<dynamic> route) => false);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("alreadyOnboarded", true);
}
