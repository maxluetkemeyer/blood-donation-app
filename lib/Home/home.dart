import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ukmblooddonation/Home/home_page_view.dart';
import 'package:ukmblooddonation/Nutzerdaten/user_data_view.dart';
import 'package:ukmblooddonation/appointment_booking/booking_start_view.dart';
import 'package:ukmblooddonation/faq/faq_view.dart';
import 'package:ukmblooddonation/impressum/impressum.dart';
import 'package:ukmblooddonation/karte/maps.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int pageIndex = 0;
  final screens = [
    HomePageView(),
    BookingStartView(),
    MyMap(),
    FaqView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: [
          PopupMenuButton<int>(
            onSelected: (value) {
              switch (value) {
                case 0:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserDataView()));
                  break;
                case 1:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Impressum()));
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Nutzerdaten"),
                value: 0,
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                child: Text("Impressum"),
                value: 1,
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