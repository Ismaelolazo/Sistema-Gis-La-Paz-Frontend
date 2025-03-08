import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:latlong2/latlong.dart';

class ServicioGeo {
  // Ejemplo para cargar un archivo GeoJSON desde assets
  Future<List<LatLng>> cargarRutaDesdeGeoJson(String rutaArchivo) async {
    final data = await rootBundle.loadString(rutaArchivo);
    final json = jsonDecode(data);
    // Se asume que el archivo GeoJSON tiene la estructura estándar.
    // Debes adaptar el parseo según la estructura exacta del archivo.
    final List<dynamic> coordenadas = json['features'][0]['geometry']['coordinates'];
    return coordenadas.map<LatLng>((coord) {
      // Suponiendo que el formato es [lng, lat]
      return LatLng(coord[1], coord[0]);
    }).toList();
  }
}
