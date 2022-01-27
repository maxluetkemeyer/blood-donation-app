import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:blooddonation/misc/env.dart' as env;

class MapWidget extends StatelessWidget {
  final TapCallback? onTap;
  final int interactiveFlag;

  const MapWidget({
    Key? key,
    this.onTap,
    this.interactiveFlag = InteractiveFlag.all,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(env.locationLat, env.locationLng),
        zoom: 15.0,
        onTap: onTap,
        interactiveFlags: interactiveFlag,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
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
    );
  }
}
