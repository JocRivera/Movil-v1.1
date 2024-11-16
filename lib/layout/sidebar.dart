import 'package:flutter/material.dart';
import '../screen/alojamientos_screen.dart';
import '../screen/reservas_screen.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 150.0,
      child: NavigationRail(
        minWidth: 54,
        groupAlignment: -1.0,
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });

          // Navegación a las pantallas según el índice seleccionado
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ReservasScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AlojamientosScreen()),
            );
          }
        },
        labelType: NavigationRailLabelType.selected,
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.book, size: 74),
            label: Text('Reservas'),
          ),
          NavigationRailDestination(
            icon: Icon(
              Icons.hotel,
              size: 74,
            ),
            label: Text('Alojamientos'),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Cierra el Drawer
          },
          icon: const Icon(Icons.home, size: 74),
        ),
      ),
    );
  }
}
