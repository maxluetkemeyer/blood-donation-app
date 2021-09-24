import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class MyMap extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Karte"),
    ),
    
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 500, child: FlutterMap(
          options: MapOptions(
            //bounds: LatLngBounds(LatLng(58.8, 6.1), LatLng(59, 6.2)),
            //boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(8.0)),
            center: LatLng(51.96168675419829, 7.600451232961736),
            zoom: 15.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']
            ),
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
          )
          ),
         Row(
           children: <Widget>[
            (Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Universit%C3%A4tsklinikum_M%C3%BCnster_Logo.svg/1200px-Universit%C3%A4tsklinikum_M%C3%BCnster_Logo.svg.png",
              width: 100, 
              fit:BoxFit.fill)),
             
             Column(
               children: <Widget>[
                const Text("Test"),
                const Text("Standort")
               ]
             )
         ] )
      ]
    )

  );
  }
}