import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../style.dart';

PageViewModel motivationPage() => PageViewModel(
      titleWidget: const Padding(
        padding: EdgeInsets.only(top: 60),
        child: Text(
          "Mit einem Bruchteil Ihrer Zeit..",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xff003866),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "also etwa eine gute Stunde – mehr Zeit müssen Sie nicht mitbringen. Die Blutspende selbst dauert beispielsweise bei einer Vollblutspende nur maximal 12 Minuten. Die Voruntersuchung, das Ausfüllen des Fragebogens und das anschließende Ausruhen brauchen aber auch etwas Zeit.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              wordSpacing: 3,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          Text(
            "..retten Sie vielleicht ein ganzes Leben.",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff003866),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      // Image from earlier version.
      //image: buildImage("assets/images/temp_blooddonation_placeholder2.jpg"),
      decoration: getOwnPageDecoration(),
      footer: const Text(
        "Alles in allem für Sie kaum mehr als ein Augenblick, der für einen schwer erkrankten oder verletzten Menschen jedoch das Leben bedeuten kann.",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, wordSpacing: 3),
        textAlign: TextAlign.center,
      ),
    );
