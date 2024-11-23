import 'package:flutter/material.dart';
import '../widget/profile/data_widget.dart';
import '../layout/menu_widget.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});
  static const routerName = '/perfil';

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    double horizontal = 20;
    double vertical = 10;
    double radio = 8.0;
    double iconSize = 180;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: horizontal,
                vertical: vertical,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade100,
              ),
              child: Icon(
                Icons.person,
                size: iconSize,
                color: Colors.white,
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DataWidget(hintText: "hintText", dataText: "dataText"),
                DataWidget(hintText: "hintText", dataText: "dataText"),
                DataWidget(hintText: "hintText", dataText: "dataText"),
                DataWidget(hintText: "hintText", dataText: "dataText"),
                DataWidget(hintText: "hintText", dataText: "dataText")
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade100,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: horizontal,
                  vertical: vertical,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radio),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cerrar Sesión"),
            )
          ],
        ),
      ),
      bottomNavigationBar: const MenuWidget(
        currentIndex: 2,
      ),
    );
  }
}
