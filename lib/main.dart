import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIS La Paz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MapPage(title: 'La Paz Map'),
    );
  }
}

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.title});

  final String title;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // La Paz coordinates: latitude: -16.489689, longitude: -68.1192936
  final LatLng laPazLocation = const LatLng(-16.489689, -68.1192936);
  double currentZoom = 13.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: laPazLocation,
          initialZoom: currentZoom,
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
          MarkerLayer(
            markers: [
              Marker(
                point: laPazLocation,
                width: 40,
                height: 40,
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                currentZoom = currentZoom + 1 > 18.0 ? 18.0 : currentZoom + 1;
              });
            },
            tooltip: 'Zoom In',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                currentZoom = currentZoom - 1 < 3.0 ? 3.0 : currentZoom - 1;
              });
            },
            tooltip: 'Zoom Out',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
