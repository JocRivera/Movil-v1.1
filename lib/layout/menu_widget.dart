import 'package:flutter/material.dart';
import '../screen/alojamientos_screen.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key, this.currentIndex});

  final int? currentIndex;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) => {
        if (value == 1)
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AlojamientosScreen()))
          }
        else if (value == 2)
          {Navigator.pushNamed(context, "/reservas")}
      },
      currentIndex: widget.currentIndex ?? 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.hotel),
          label: "Alojamientos",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: "Reservas",
        ),
      ],
    );
  }
}
