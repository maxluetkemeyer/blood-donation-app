import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        //TODO: Implement Android 12 physics
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 300,
            child: FlutterMap(
              options: MapOptions(
                //bounds: LatLngBounds(LatLng(58.8, 6.1), LatLng(59, 6.2)),
                //boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(8.0)),
                center: LatLng(51.96168675419829, 7.600451232961736),
                zoom: 15.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(51.96168675419829, 7.600451232961736),
                      builder: (context) => Icon(
                        Icons.add_location_alt_rounded,
                        size: 50,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Überschrift
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Blutspende am UKM",
                style: TextStyle(
                    color: Color(0xff003866),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Für jede Zeile Text eine neue Row hinzufügen
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //UKM Image
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                    'assets/images/Universitätsklinikum_Münster_Logo.png'),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 8),
                    child: InkWell(
                      child: const Text(
                        "Albert-Schweitzer-Campus 1\n48149 Münster\nAnfahrtsadresse:\nDomagkstr. 11, Gebäude D11",
                      ),
                      onTap: () => launch(
                        'https://www.google.de/maps/dir//UKM+Blutspende,+Domagkstra%C3%9Fe+11,+48149+M%C3%BCnster/@51.9609801,7.5971615,17z/data=!4m16!1m6!3m5!1s0x47b9baa498c7d0c9:0x3de4d6b0e7ea3f0d!2sUKM+Blutspende!8m2!3d51.9616783!4d7.600453!4m8!1m0!1m5!1m1!1s0x47b9baa498c7d0c9:0x3de4d6b0e7ea3f0d!2m2!1d7.600453!2d51.9616783!3e3',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2),
                    child: Text("Telelefonnr.: 0251 - 83 58000"),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(3),
                    child: Text("blutspende@­ukmuenster.de"),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Image(
            image: AssetImage(
              "assets/images/UKM_Blutspende_Muenster_Eingang.jpg",
            ),
          ),
        ],
      ),
    );
  }
}
