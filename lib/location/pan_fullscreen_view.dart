import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:blooddonation/misc/env.dart' as env;

class PanFullScreen extends StatelessWidget {
  final double initialLatitude;
  final double initialLongitude;
  final double initialTilt;

  const PanFullScreen({
    Key? key,
    required this.initialLatitude,
    required this.initialLongitude,
    required this.initialTilt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "panorama",
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => launch(env.locationLink),
              icon: const Icon(Icons.open_in_new_outlined),
            ),
          ],
        ),
        body: Panorama(
          key: GlobalKey(),
          sensitivity: 1.3,
          //Buggy
          //latitude: initialLatitude,
          //longitude: initialLongitude,
          child: Image.asset("assets/images/entrance_panorama.jpg"),
        ),
      ),
    );
  }
}
