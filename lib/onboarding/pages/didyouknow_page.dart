import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:url_launcher/link.dart';

import '../style.dart';

PageViewModel didyouknowPage() => PageViewModel(
      title: "Wussten Sie..",
      bodyWidget: const Text(
        "..dass in Deutschland täglich über 15.000 Blutspenden benötigt werden?\n\n..dass eine einzelne Blutspende bis zu drei Leben retten kann?\n\n..dass der menschliche Körper ca. fünf Liter Blut enthält?",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, wordSpacing: 3),
        textAlign: TextAlign.justify,
      ),
      footer: Link(
        uri: Uri.parse('https://ukm-blutspende.de/index.php?id=wussten-sie'),
        builder: (context, followLink) => GestureDetector(
          onTap: followLink,
          child: const Text(
            "Mehr Informationen finden Sie hier",
            style: TextStyle(fontSize: 15, decoration: TextDecoration.underline),
          ),
        ),
        target: LinkTarget.self,
      ),
      decoration: getOwnPageDecoration(),
    );
