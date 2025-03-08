import 'package:flutter/material.dart';
import 'map_page.dart';
// Si tienes más pantallas, las importas aquí
// import 'lugares_page.dart';
// import 'rutas_page.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({Key? key}) : super(key: key);

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int _indiceActual = 0;

  // Lista de las pantallas que mostrará el BottomNavigationBar
  final List<Widget> _pantallas = [
    // Primera pestaña: Ejemplo "Inicio" o "Bienvenida"
    const Center(child: Text('Inicio - Bienvenido al GIS La Paz')),
    // Segunda pestaña: Mapa
    const MapPage(title: 'Mapa de La Paz'),
    // Tercera pestaña (opcional): Lugares o Rutas
    // const LugaresPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema GIS La Paz'),
      ),
      body: _pantallas[_indiceActual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceActual,
        onTap: (int indice) {
          setState(() {
            _indiceActual = indice;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          // Si agregas más pantallas, añade más BottomNavigationBarItem
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.location_on),
          //   label: 'Lugares',
          // ),
        ],
      ),
    );
  }
}
