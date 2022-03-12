import 'package:blooddonation/location/map/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:blooddonation/misc/env.dart' as env;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MapFullScreen extends StatelessWidget {
  const MapFullScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "map",
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton.icon(
              onPressed: () => launch(env.locationLink),
              icon: const Icon(Icons.open_in_new_outlined),
              label: Text(AppLocalizations.of(context)!.mapToMapsProvider),
            ),
          ],
        ),
        body: MapWidget(
          key: GlobalKey(),
        ),
      ),
    );
  }
}
