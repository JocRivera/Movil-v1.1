import 'package:flutter/material.dart';
import '../widget/content.dart';
import '../layout/navbar.dart';
import '../layout/menu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(),
      body: Content(),
      bottomNavigationBar: MenuWidget(),
    );
  }
}
