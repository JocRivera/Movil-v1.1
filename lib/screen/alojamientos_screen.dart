import 'package:bookedge/widget/utilities/search_filtered_bar.dart';
import 'package:flutter/material.dart';
import '../widget/utilities/grid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AlojamientosScreen extends StatefulWidget {
  const AlojamientosScreen({super.key});

  static const routeName = '/alojamientos';

  @override
  State<AlojamientosScreen> createState() => _AlojamientosScreenState();
}

class _AlojamientosScreenState extends State<AlojamientosScreen> {
  late Future<List<dynamic>> _alojamientosFuture;
  String _filterType = 'all';
  List<dynamic> _filteredItems = [];
  String _searchQuery = '';
  final List<Map<String, String>> _filterOptions = [
    {'value': 'all', 'label': 'All'},
    {'value': 'available', 'label': 'Available'},
    {'value': 'reserved', 'label': 'Reserved'},
    {'value': 'unavailable', 'label': 'Unavailable'},
  ];

  @override
  void initState() {
    super.initState();
    _alojamientosFuture = fetchAlojamiento();
  }

  Future<List<dynamic>> fetchAlojamiento() async {
    try {
      final response = await http.get(
        Uri.parse('https://localhost:7162/alojamientoes'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List<dynamic>;
        setState(() {
          _filteredItems = List.from(data);
        });
        return data;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load: $e');
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
    _alojamientosFuture.then((allItems) {
      setState(() {
        _filteredItems = allItems.where((item) {
          bool matchesSearch = _searchQuery.isEmpty ||
              item['nombre']
                  .toString()
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase());

          bool matchesFilter =
              _filterType == 'all' || item['estado'].toString() == _filterType;

          return matchesSearch && matchesFilter;
        }).toList();
      });
    }).catchError((error) {
      // Manejar el error si ocurre durante el filtrado
      debugPrint('Error during filtering: $error');
    });
  }

  Widget _buildErrorWidget(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 60),
          const SizedBox(height: 16),
          Text(
            message,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _alojamientosFuture = fetchAlojamiento();
              });
            },
            child: const Text('Reintentar'),
          ),
        ],
      ),
    );
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
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: _alojamientosFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return _buildErrorWidget(snapshot.error.toString());
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No hay alojamientos disponibles'),
                  );
                }

                return Grid(items: _filteredItems);
              },
            ),
          ),
        ],
      ),
    );
  }
}
