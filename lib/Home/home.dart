import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ukmblooddonation/Home/home_page_view.dart';
import 'package:ukmblooddonation/Home/more_view.dart';
import 'package:ukmblooddonation/faq/faq_view.dart';
import 'package:ukmblooddonation/karte/maps.dart';
import 'package:ukmblooddonation/termin_buchung/termin_buchung_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int pageIndex = 0;
  final screens = [
    HomePageView(),
    TerminBuchung(),
    MyMap(),
    FaqView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => MoreView())),
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: screens[pageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: pageIndex,
        onDestinationSelected: (index) => setState(() {
          pageIndex = index;
        }),
        //labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Start",
          ),
          NavigationDestination(
            icon: Icon(Icons.date_range_outlined),
            selectedIcon: Icon(Icons.date_range),
            label: "Termine",
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: "Karte",
          ),
          NavigationDestination(
            icon: Icon(Icons.help_outline),
            selectedIcon: Icon(Icons.help),
            label: "FAQ",
          ),
        ],
      ),
    );
  }
}

//Home, Anmeldung, Karte, FAQ
//More: Daten, Impressum