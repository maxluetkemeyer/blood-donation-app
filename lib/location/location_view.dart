import 'package:blooddonation/location/map_fullscreen_view.dart';
import 'package:blooddonation/location/pan_fullscreen_view.dart';
import 'package:blooddonation/misc/env.dart' as env;
import 'package:blooddonation/location/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:panorama/panorama.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);

  ///[TextStyle] for contact and routing to the blood donation location.
  final TextStyle contactData = const TextStyle(
    fontSize: 15,
  );

  ///Build method to give the user contact information and routing information.
  ///
  ///Returns a [Widget] tree.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ClipRect(
            child: SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Hero(
                    tag: "panorama",
                    child: Panorama(
                      key: GlobalKey(),
                      onTap: (longitude, latitude, tilt) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PanFullScreen(
                            initialLatitude: latitude,
                            initialLongitude: longitude,
                            initialTilt: tilt,
                          ),
                        ),
                      ),
                      child: Image.asset("assets/images/entrance_panorama.jpg"),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Icon(
                      Icons.touch_app_rounded,
                      color: Colors.white.withOpacity(0.7),
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.mapHeading,
                style: const TextStyle(
                  color: Color(0xff003866),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //UKM Image
              const SizedBox(
                width: 100,
                height: 100,
                child: Image(
                  image: AssetImage("assets/images/Universitätsklinikum_Münster_Logo.png"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: InkWell(
                      child: Text(
                        "Albert-Schweitzer-Campus 1\n48149 Münster\n\n" +
                            AppLocalizations.of(context)!.mapDirections +
                            ":\nDomagkstr. 11, Gebäude D11",
                        style: contactData,
                      ),
                      onTap: () => launch(env.locationLink),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: InkWell(
                      child: Row(
                        children: [
                          const Icon(Icons.phone),
                          const SizedBox(width: 10),
                          Text(
                            "Tel.: +49 251 8358000",
                            style: contactData,
                          ),
                        ],
                      ),
                      onTap: () => launch('tel:+492518358000'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: Text("blutspende@­ukmuenster.de", style: contactData),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                Hero(
                  tag: "map",
                  child: MyMap(
                    key: GlobalKey(),
                    onTap: (tapPosition, point) => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MapFullScreen()),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Icon(
                    Icons.touch_app_rounded,
                    color: Colors.white.withOpacity(0.7),
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
