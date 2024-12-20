import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  double latitude = -6.562590128519317 ;
  double longitude = 107.76263279967436;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps'),
      ),
      body:Container(
      width: double.infinity,
      child: FlutterMap(
        options: MapOptions(
          initialZoom: 10,
          initialCenter: LatLng(latitude,longitude),
        ), children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(markers: [
            Marker(
            point: LatLng(latitude, longitude), 
            child: const Icon(
              Icons.car_rental,
              color: Colors.red,
              size: 32,
            ))
          ])
        ],
      ),
    ) ,
  );
  }
}