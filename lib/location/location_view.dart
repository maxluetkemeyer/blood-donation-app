import 'package:blooddonation/location/institution_info.dart';
import 'package:blooddonation/location/map/map.dart';
import 'package:blooddonation/location/panorama/panorama.dart';
import 'package:flutter/material.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);

  ///Build method to give the user contact information and routing information.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          MyPanorama(),
          CompanyInfo(),
          MyMap(),
        ],
      ),
    );
  }
}
