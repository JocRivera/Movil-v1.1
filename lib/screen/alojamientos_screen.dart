import 'package:bookedge/model/Alojamiento.dart';
import 'package:bookedge/service/get_alojamientos.dart';
import 'package:bookedge/widget/utilities/search_filtered_bar.dart';
import 'package:flutter/material.dart';
import '../widget/utilities/grid.dart';

class AlojamientosScreen extends StatefulWidget {
  const AlojamientosScreen({super.key});
  static const routeName = '/alojamientos';
  @override
  State<AlojamientosScreen> createState() => _AlojamientosScreenState();
}

class _AlojamientosScreenState extends State<AlojamientosScreen> {
  // Datos estáticos (quemados)
  List<Alojamiento> _alojamientos = [];
  String _filterType = 'todas';
  String _searchQuery = '';
  List<Map<String, dynamic>> _filteredItems = [];
  final List<Map<String, String>> _filterOptions = [
    {'value': 'todas', 'label': 'Todas'},
    {'value': 'disponible', 'label': 'Disponible'},
    {'value': 'mantenimiento', 'label': 'Mantenimiento'},
  ];

  @override
  void initState() {
    super.initState();
    _fetchAlojamientos();
    // Inicializa los elementos filtrados con todos los alojamientos
  }

  Future<void> _fetchAlojamientos() async {
    try {
      final alojamientos = await GetAlojamientos.fetch();
      setState(() {
        _alojamientos = alojamientos;
        _filteredItems =
            _alojamientos.map((alojamiento) => alojamiento.toJson()).toList();
      });
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al cargar los alojamientos'),
        ),
      );
    }
  }

  void _handleSearchChanged(String value) {
    setState(() {
      _searchQuery = value;
      _filterItems();
    });
  }

  void _handleFilterChanged(String value) {
    setState(() {
      _filterType = value;
      _filterItems();
    });
  }

  void _filterItems() {
    setState(() {
      _filteredItems = _alojamientos
          .map((alojamiento) => alojamiento.toJson())
          .where((item) {
        bool matchesSearch = _searchQuery.isEmpty ||
            item['tipo']!.toLowerCase().contains(_searchQuery.toLowerCase());

        bool matchesFilter =
            _filterType == 'todas' || item['estado'] == _filterType;

        return matchesSearch && matchesFilter;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alojamientos'),
      ),
      body: Column(
        children: [
          SearchFilterBar(
            onSearchChanged: _handleSearchChanged,
            onFilterChanged: _handleFilterChanged,
            filterType: _filterType,
            filterOptions: _filterOptions,
          ),
          // Aquí se muestra el Grid con los elementos filtrados
          Expanded(
            child: Grid(
              items: _filteredItems,
              tittle: (item) => item['idAlojamiento'].toString(),
            ), // Se pasan los items filtrados
          ),
        ],
      ),
    );
  }
}
