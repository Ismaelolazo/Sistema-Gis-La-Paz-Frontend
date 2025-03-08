import 'package:flutter/material.dart';
import 'configuracion/tema.dart';
import 'screens/pantalla_principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIS La Paz',
      theme: temaApp, 
      home: const PantallaPrincipal(),
    );
  }
}
