//@dart = 2.9

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ukmblutspende/faq/faq_view.dart';
import 'package:ukmblutspende/karte/maps.dart';
import 'package:ukmblutspende/main.dart';
import 'package:ukmblutspende/termin_buchung/termin_buchung_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UKM Blutspende',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Card(
                  elevation: 5,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    itemBuilder: (BuildContext context, int index) {
                      return _buildCarousel(context, index ~/ 2);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TerminBuchung()),
                      );
                    },
                    child: Text('Terminanmeldung')),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
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
              ListTile(
                title: Text(
                  'Home',
                  style: Theme.of(context).textTheme.headline2,
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Anmeldung',
                  style: Theme.of(context).textTheme.headline2,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TerminBuchung()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Karte',
                  style: Theme.of(context).textTheme.headline2,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyMap()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Daten',
                  style: Theme.of(context).textTheme.headline2,
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  'FAQ',
                  style: Theme.of(context).textTheme.headline2,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Faq()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Impressum',
                  style: Theme.of(context).textTheme.headline2,
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Carousel $carouselIndex'),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 200.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, carouselIndex, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }
}
