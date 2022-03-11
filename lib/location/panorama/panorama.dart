import 'package:blooddonation/location/panorama/pan_fullscreen_view.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class MyPanorama extends StatelessWidget {
  const MyPanorama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SizedBox(
        height: 300,
        child: Stack(
          children: [
            Hero(
              key: const ValueKey("panoramaImage"),
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
                child: const Image(
                  image: AssetImage("assets/images/entrance_panorama.jpg"),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Icon(
                Icons.threesixty_rounded,
                color: Colors.white.withOpacity(0.7),
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
