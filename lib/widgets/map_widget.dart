import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final LatLng ubicacionLaPaz = const LatLng(-16.489689, -68.1192936);
  double zoomActual = 13.0;

  // Ejemplo de una ruta (para trufis, micros, minibuses, etc.)
  final List<LatLng> rutaEjemplo = [
    LatLng(-16.489689, -68.1192936),
    LatLng(-16.490500, -68.120000),
    LatLng(-16.491000, -68.121000),
    // Agrega más puntos según la ruta real...
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            center: ubicacionLaPaz,
            zoom: zoomActual,
            maxZoom: 18.0,
            minZoom: 3.0,
          ),
          children: [
            // Capa base con CartoDB Positron
            TileLayer(
              urlTemplate: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
              userAgentPackageName: 'com.gislapaz.app',
              subdomains: const ['a', 'b', 'c', 'd'],
              additionalOptions: const {
                'attribution': '© OpenStreetMap contributors © CARTO',
              },
            ),
            // Capa de rutas
            PolylineLayer(
              polylines: [
                Polyline(
                  points: rutaEjemplo,
                  strokeWidth: 4.0,
                  color: Colors.blue,
                ),
              ],
            ),
            // Capa de marcadores
            MarkerLayer(
              markers: [
                
              ],
            ),
          ],
        ),
        // Botones flotantes para zoom
        Positioned(
          bottom: 16,
          right: 16,
          child: Column(
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    zoomActual = zoomActual + 1 > 18.0 ? 18.0 : zoomActual + 1;
                  });
                },
                tooltip: 'Acercar',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 16),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    zoomActual = zoomActual - 1 < 3.0 ? 3.0 : zoomActual - 1;
                  });
                },
                tooltip: 'Alejar',
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
