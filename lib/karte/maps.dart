import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MyMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Karte"),
        ),
        body: SingleChildScrollView(
            //Scrollfunktion

            //Karte hinzufügen
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
              SizedBox(
                  height: 500,
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
                          subdomains: ['a', 'b', 'c']),
                      MarkerLayerOptions(
                        markers: [
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: LatLng(51.96168675419829, 7.600451232961736),
                            builder: (context) => Icon(
                              Icons.add_location_alt_rounded,
                              size: 40,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),

              //Überschrift
              SizedBox(
                  height: 50,
                  child: Center(
                      child: Text("Blutspende am UKM",
                          style: TextStyle(
                              color: Color(0xff003866),
                              fontSize: 22,
                              fontWeight: FontWeight.bold)))),

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //UKM-Image
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Container(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                              'assets/images/Universitätsklinikum_Münster_Logo.png')),
                      //width: 100,
                      //fit: BoxFit.fill,
                    ),

                    Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                            "Albert-Schweitzer-Campus 1\n48149 Münster\nAnfahrtsadresse:\nDomagkstr. 11, Gebäude D11\nTel.: 0251 - 83 58000\nblutspende@­ukmuenster.de",
                            style: TextStyle(
                                color: Color(0xff003866),
                                fontWeight: FontWeight.bold,
                                fontSize: 14.5)),
                      ),
                    ])
                  ])
            ]))));
  }
}
