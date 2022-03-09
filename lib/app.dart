import 'package:blooddonation/misc/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:blooddonation/booking/booking_view.dart';
import 'package:blooddonation/faq/faq_view.dart';
import 'package:blooddonation/location/location_view.dart';
import 'package:showcaseview/showcaseview.dart';

import 'home/home_view.dart';

class App extends StatefulWidget {
  final int initalPageIndex;
  final bool showShowcase;

  const App({
    Key? key,
    this.initalPageIndex = 0,
    this.showShowcase = false,
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

  final showcaseKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  @override
  void initState() {
    super.initState();
    pageIndex = widget.initalPageIndex;

    print("showShowcase " + widget.showShowcase.toString());
    if (widget.showShowcase) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        //Needed to delay the showcase call due to visual bugs
        Future.delayed(const Duration(milliseconds: 100)).then(
          (_) => ShowCaseWidget.of(context)!.startShowCase(showcaseKeys),
        );
      });
    }
  }

  ///Defines the Page Design for every Navigation oriented screen.
  ///
  ///New pages are accessed by the [screens] array-defined [Widget]'s.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Showcase(
            description: (AppLocalizations.of(context)!.userOnboardingIntroduction),
            key: showcaseKeys[0],
            descTextStyle: const TextStyle(fontSize: 20),
            child: const Image(
              image: AssetImage("assets/images/logo.jpeg"),
            ),
          ),
        ),
        actions: [
          Showcase(
            description: (AppLocalizations.of(context)!.userOnboardingMore),
            key: showcaseKeys[5],
            descTextStyle: const TextStyle(fontSize: 20),
            shapeBorder: const CircleBorder(),
            child: const AppBarMenuButton(),
          )
        ],
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
            Showcase(
              description: (AppLocalizations.of(context)!.userOnboardinImpressions),
              key: showcaseKeys[1],
              descTextStyle: const TextStyle(fontSize: 20),
              child: NavigationDestination(
                key: const ValueKey('start'),
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(Icons.home),
                label: AppLocalizations.of(context)!.homeMenuStart,
              ),
            ),
            Showcase(
              description: (AppLocalizations.of(context)!.userOnboardingBooking),
              key: showcaseKeys[2],
              descTextStyle: const TextStyle(fontSize: 20),
              child: NavigationDestination(
                key: const ValueKey('appointment'),
                icon: const Icon(Icons.date_range_outlined),
                selectedIcon: const Icon(Icons.date_range),
                label: AppLocalizations.of(context)!.homeMenuAppointment,
              ),
            ),
            Showcase(
              description: (AppLocalizations.of(context)!.userOnboardingLocation),
              key: showcaseKeys[3],
              descTextStyle: const TextStyle(fontSize: 20),
              child: NavigationDestination(
                key: const ValueKey('map'),
                icon: const Icon(Icons.map_outlined),
                selectedIcon: const Icon(Icons.map),
                label: AppLocalizations.of(context)!.homeMenuMap,
              ),
            ),
            Showcase(
              description: (AppLocalizations.of(context)!.userOnboardingFAQ),
              key: showcaseKeys[4],
              descTextStyle: const TextStyle(fontSize: 20),
              child: NavigationDestination(
                key: const ValueKey('faq'),
                icon: const Icon(Icons.help_outline),
                selectedIcon: const Icon(Icons.help),
                label: AppLocalizations.of(context)!.homeMenuFaq,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
