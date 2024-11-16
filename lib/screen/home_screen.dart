import 'package:flutter/material.dart';
import '../widget/content.dart';
import '../layout/navbar.dart';
import '../layout/sidebar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      drawer: const Sidebar(),
      body: const Content(),
    );
  }
}
