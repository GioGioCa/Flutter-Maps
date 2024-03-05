import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1Ijoiem9kaWFyayIsImEiOiJjbHRkdDU4ZWQwNzB1MmpwN21hZGdiN25rIn0.vha1owhjdzEK5d4YwPT8iA';

final myPosition = LatLng(latitude, longitude);

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Map'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: myPosition,
          minZoom: 5,
          maxZoom: 25,
          initialZoom: 18,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                additionalOptions: const {
                  'accessToken': MAPBOX_ACCESS_TOKEN,
                  'id': 'mapbox/navigation-night-v1',
                },
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: myPosition, child: const FlutterLogo()),
            ]
            ),
        ],
      ),
    );
  }
}
