import 'package:blooddonation/misc/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:blooddonation/booking/booking_view.dart';
import 'package:blooddonation/faq/faq_view.dart';
import 'package:blooddonation/location/location_view.dart';

import 'home/home_view.dart';

class App extends StatefulWidget {
  final int initalPageIndex;

  const App({
    Key? key,
    this.initalPageIndex = 0,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int pageIndex = 0;

  final screens = [
    const HomePageView(),
    const BookingView(),
    const LocationView(),
    const FaqView(),
  ];

  @override
  void initState() {
    super.initState();
    pageIndex = widget.initalPageIndex;
  }

  ///Defines the Page Design for every Navigation oriented screen.
  ///
  ///New pages are accessed by the [screens] array-defined [Widget]'s.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: const [AppBarMenuButton()],
      ),
      body: screens[pageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(color: Theme.of(context).primaryColor),
          ),
          iconTheme: MaterialStateProperty.all(
            IconThemeData(color: Theme.of(context).primaryColor),
          ),
          backgroundColor: Colors.white,
        ),
        child: NavigationBar(
          selectedIndex: pageIndex,
          onDestinationSelected: (index) => setState(() {
            pageIndex = index;
          }),
          destinations: [
            NavigationDestination(
              key: const ValueKey('start'),
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),
              label: AppLocalizations.of(context)!.homeMenuStart,
            ),
            NavigationDestination(
              key: const ValueKey('appointment'),
              icon: const Icon(Icons.date_range_outlined),
              selectedIcon: const Icon(Icons.date_range),
              label: AppLocalizations.of(context)!.homeMenuAppointment,
            ),
            NavigationDestination(
              key: const ValueKey('map'),
              icon: const Icon(Icons.map_outlined),
              selectedIcon: const Icon(Icons.map),
              label: AppLocalizations.of(context)!.homeMenuMap,
            ),
            NavigationDestination(
              key: const ValueKey('faq'),
              icon: const Icon(Icons.help_outline),
              selectedIcon: const Icon(Icons.help),
              label: AppLocalizations.of(context)!.homeMenuFaq,
            ),
          ],
        ),
      ),
    );
  }
}
