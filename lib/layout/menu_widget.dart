import 'package:bookedge/screen/alojamientos_screen.dart';
import 'package:flutter/material.dart';
import '../screen/reservas_screen.dart';
import '../screen/home_screen.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key, this.currentIndex});

  final int? currentIndex;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  int? _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
        if (value == 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ReservasScreen()));
        }
        if (value == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AlojamientosScreen()));
        } else if (value == 2) {
          Navigator.pushNamed(context, "/Profile");
        }
      },
      currentIndex: widget.currentIndex ?? 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: "Reservas",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.hotel),
          label: "Alojamientos",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Perfil",
        ),
      ],
    );
  }
}
