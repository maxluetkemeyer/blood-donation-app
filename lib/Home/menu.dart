import 'package:flutter/material.dart';

import './list_object.dart';

import '../Nutzerdaten/nutzerdaten.dart';
import '../impressum/impressum.dart';
import '../Home/home.dart';
import '../faq/faq_view.dart';
import '../karte/maps.dart';
import '../termin_buchung/termin_buchung_view.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Image(
                    image: AssetImage(
                        'assets/images/Universitätsklinikum_Münster_Logo.png')),
              ),
            ),
            ListObject(title: 'Home', onTap: HomeView()),
            ListObject(
              title: 'Anmeldung',
              onTap: TerminBuchung(),
            ),
            ListObject(
              title: 'Karte',
              onTap: MyMap(),
            ),
            ListObject(
              title: 'Daten',
              onTap: Nutzerdaten(),
            ),
            ListObject(
              title: 'FAQ',
              onTap: FaqView(),
            ),
            ListObject(
              title: 'Impressum',
              onTap: Impressum(),
            ),
          ],
        ),
      ),
    );
  }
}
