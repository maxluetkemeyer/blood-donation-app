import 'package:blooddonation/user_data/user_data_view.dart';
import 'package:blooddonation/appointment_booking/bookingstart_view.dart';
import 'package:blooddonation/faq/faq_view.dart';
import 'package:blooddonation/imprint/imprint_view.dart';
import 'package:blooddonation/location/location_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'home/home_view.dart';

class AppStructure extends StatefulWidget {
  const AppStructure({Key? key}) : super(key: key);

  @override
  State<AppStructure> createState() => _AppStructureState();
}

class _AppStructureState extends State<AppStructure> {
  int pageIndex = 0;

  final screens = [
    const HomePageView(),
    const BookingStartView(),
    const LocationView(),
    const FaqView(),
  ];

  ///Defines the Page Design for every Navigation oriented screen.
  ///
  ///New pages are accessed by the [screens] array-defined [Widget]'s.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: [
          PopupMenuButton<int>(
            key: const ValueKey('popUpDots'),
            onSelected: (value) {
              switch (value) {
                case 0:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const UserDataView()));
                  break;
                case 1:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ImprintView()));
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                key: const ValueKey('userDataButton'),
                value: 0,
                child: Text(AppLocalizations.of(context)!.homeMenuUserData),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                key: const ValueKey('imprintButton'),
                value: 1,
                child: Text(AppLocalizations.of(context)!.homeMenuImprint),
              ),
            ],
          ),
        ],
      ),
      body: screens[pageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(TextStyle(color: Theme.of(context).colorScheme.secondary)),
            iconTheme: MaterialStateProperty.all(IconThemeData(color: Theme.of(context).colorScheme.secondary)),
            //indicatorColor: Theme.of(context).colorScheme.outline,
            backgroundColor: Theme.of(context).primaryColor),
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
