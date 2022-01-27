import 'package:blooddonation/location/map/map_fullscreen_view.dart';
import 'package:blooddonation/location/map/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';

class MyMap extends StatelessWidget {
  const MyMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Hero(
            tag: "map",
            child: MapWidget(
              key: GlobalKey(),
              interactiveFlag: InteractiveFlag.none,
              onTap: (tapPosition, point) => Navigator.push(context, MaterialPageRoute(builder: (context) => const MapFullScreen())),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.touch_app_rounded,
              color: Colors.black.withOpacity(0.5),
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
