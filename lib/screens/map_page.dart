import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final LatLng laPazLocation = const LatLng(-16.489689, -68.1192936);
  double currentZoom = 13.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: laPazLocation,
          zoom: currentZoom,
          maxZoom: 18.0,
          minZoom: 3.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
            userAgentPackageName: 'com.gislapaz.app',
            subdomains: const ['a', 'b', 'c', 'd'],
            additionalOptions: const {
              'attribution': '© OpenStreetMap contributors © CARTO',
            },
          ),
          // Aquí irían tus PolylineLayer, MarkerLayer, etc.
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                currentZoom = (currentZoom + 1).clamp(3.0, 18.0);
              });
            },
            tooltip: 'Acercar',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                currentZoom = (currentZoom - 1).clamp(3.0, 18.0);
              });
            },
            tooltip: 'Alejar',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
