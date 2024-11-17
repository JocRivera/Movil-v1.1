import 'package:flutter/material.dart';
import './home/build_card.dart';
import '../screen/reservas_screen.dart';
import '../screen/alojamientos_screen.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bookedege',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                BuildCard(
                  icon: Icons.hotel,
                  label: 'Alojamientos',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AlojamientosScreen()));
                  },
                ),
                BuildCard(
                  icon: Icons.book,
                  label: 'Reservas',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReservasScreen()));
                  },
                ),
              ],
            )
          ],
        ));
  }
}
