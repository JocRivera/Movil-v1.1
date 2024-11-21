import 'package:flutter/material.dart';
import 'package:bookedge/widget/utilities/search_filtered_bar.dart';
import 'package:bookedge/widget/utilities/list_content.dart';

class ReservasScreen extends StatefulWidget {
  const ReservasScreen({super.key});
  static const routeName = '/reservas';

  @override
  State<ReservasScreen> createState() => _ReservasScreenState();
}

class _ReservasScreenState extends State<ReservasScreen> {
  String _filterType = 'todas';
  String _searchQuery = '';
  String? expandedStatus;
  final List<Map<String, dynamic>> _reservas = [
    {
      'id': '1',
      'plan': 'Plan 1',
      'alojamiento': 'Cabaña 1',
      'cliente': 'Cliente 1',
      'fechaInicio': '2024-11-17',
      'fechaFin': '2024-11-20',
      'estado': 'pendiente',
    },
    {
      'id': '2',
      'plan': 'Plan 2',
      'alojamiento': 'Cabaña 2',
      'cliente': 'Cliente 2',
      'fechaInicio': '2024-11-17',
      'fechaFin': '2024-11-20',
      'estado': 'confirmada',
    },
    {
      'id': '3',
      'plan': 'Plan 3',
      'alojamiento': 'Cabaña 3',
      'cliente': 'Cliente 3',
      'fechaInicio': '2024-11-17',
      'fechaFin': '2024-11-20',
      'estado': 'cancelada',
    },
    {
      'id': '4',
      'plan': 'Plan 4',
      'alojamiento': 'Cabaña 4',
      'cliente': 'Cliente 4',
      'fechaInicio': '2024-11-17',
      'fechaFin': '2024-11-20',
      'estado': 'terminada',
    },
    {
      'id': '5',
      'plan': 'Plan 5',
      'alojamiento': 'Cabaña 5',
      'cliente': 'Cliente 5',
      'fechaInicio': '2024-11-17',
      'fechaFin': '2024-11-20',
      'estado': 'pendiente',
    },
    {
      'id': '6',
      'plan': 'Plan 6',
      'alojamiento': 'Cabaña 6',
      'cliente': 'Cliente 6',
      'fechaInicio': '2024-11-17',
      'fechaFin': '2024-11-20',
      'estado': 'confirmada',
    }
  ];

  final List<Map<String, String>> _filterOptions = [
    {'value': 'todas', 'label': 'Todas'},
    {'value': 'pendiente', 'label': 'Pendiente'},
    {'value': 'confirmada', 'label': 'Confirmada'},
    {'value': 'cancelada', 'label': 'Cancelada'},
    {'value': 'terminada', 'label': 'Terminada'},
  ];

  void _handleSearchChanged(String value) {
    setState(() {
      _searchQuery = value;
    });
  }

  void _handleFilterChanged(String value) {
    setState(() {
      _filterType = value;
    });
  }

  List<Map<String, dynamic>> get _filteredReservas {
    return _reservas.where((reserva) {
      final matchesSearchQuery =
          reserva['cliente'].toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesFilterType = _filterType == 'todas' ||
          reserva['estado'].toLowerCase() == _filterType.toLowerCase();
      return matchesSearchQuery && matchesFilterType;
    }).toList();
  }

  Map<String, List<Map<String, dynamic>>> get groupedReservas {
    final Map<String, List<Map<String, dynamic>>> grouped = {};
    for (var reserva in _filteredReservas) {
      grouped.putIfAbsent(reserva['estado'], () => []).add(reserva);
    }
    return grouped;
  }

  List<String> get sortedStatuses {
    final statuses = groupedReservas.keys.toList();
    statuses.sort((a, b) {
      final order = ['pendiente', 'confirmada', 'cancelada', 'terminada'];
      return order.indexOf(a).compareTo(order.indexOf(b));
    });
    return statuses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservas'),
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
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sortedStatuses.length,
              itemBuilder: (context, index) {
                final status = sortedStatuses[index];
                final reservas = groupedReservas[status]!;

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          '${status.toUpperCase()} Reservas',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        trailing: Icon(
                          expandedStatus == status
                              ? Icons.expand_less
                              : Icons.expand_more,
                        ),
                        onTap: () {
                          setState(() {
                            expandedStatus =
                                expandedStatus == status ? null : status;
                          });
                        },
                      ),
                      if (expandedStatus == status)
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: reservas.length,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (context, index) {
                            final reserva = reservas[index];
                            return ListContent(data: reserva);
                          },
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
