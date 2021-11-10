import 'package:blooddonation/user_data/user_data_view.dart';
import 'package:blooddonation/appointment_booking/bookingstart_view.dart';
import 'package:blooddonation/faq/faq_view.dart';
import 'package:blooddonation/imprint/imprint_view.dart';
import 'package:blooddonation/location/location_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_page_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int pageIndex = 0;
  final screens = [
    const HomePageView(),
    const BookingStartView(),
    const LocationView(),
    const FaqView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(AppLocalizations.of(context)!.appTitle),
        title: Text("UKM Blutspende App"),
        actions: [
          PopupMenuButton<int>(
            onSelected: (value) {
              switch (value) {
                case 0:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserDataView()));
                  break;
                case 1:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ImprintView()));
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 0,
                child: Text("Nutzerdaten"),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 1,
                child: Text("Impressum"),
              ),
            ],
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
        destinations: const [
          NavigationDestination(
            key: ValueKey('start'),
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Start",
          ),
          NavigationDestination(
            key: ValueKey('appointment'),
            icon: Icon(Icons.date_range_outlined),
            selectedIcon: Icon(Icons.date_range),
            label: "Termine",
          ),
          NavigationDestination(
            key: ValueKey('map'),
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: "Karte",
          ),
          NavigationDestination(
            key: ValueKey('faq'),
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