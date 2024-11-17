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
  final List<Map<String, dynamic>> _alojamientos = [
    {
      'id': '1',
      'tipo': 'Cabaña',
      'capacidad': '4',
      'estado': 'disponible',
      'comodidades': ['wifi', 'jacuzzi'],
    },
    {
      'id': '2',
      'tipo': 'Cabaña',
      'capacidad': '6',
      'estado': 'mantenimiento',
      'comodidades': ['wifi', 'jacuzzi'],
    },
    {
      'id': '3',
      'tipo': 'Cabaña',
      'capacidad': '4',
      'estado': 'disponible',
      'comodidades': ['wifi', 'jacuzzi'],
    },
    {
      'id': '4',
      'tipo': 'Habitacion',
      'capacidad': '6',
      'estado': 'mantenimiento',
      'comodidades': ['wifi', 'jacuzzi'],
    },
    {
      'id': '5',
      'tipo': 'Habitacion',
      'capacidad': '4',
      'estado': 'disponible',
      'comodidades': ['wifi', 'jacuzzi'],
    },
    {
      'id': '6',
      'tipo': 'Habitacion',
      'capacidad': '6',
      'estado': 'mantenimiento',
      'comodidades': ['wifi', 'jacuzzi'],
    },
  ];
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
    GetAlojamientos.fetch();
    _filteredItems =
        _alojamientos; // Inicializa los elementos filtrados con todos los alojamientos
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
      _filteredItems = _alojamientos.where((item) {
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
              tittle: (item) => item['id']!,
            ), // Se pasan los items filtrados
          ),
        ],
      ),
    );
  }
}
