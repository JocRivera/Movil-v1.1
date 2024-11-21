import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final Map<String, dynamic> data;
  final String tittle;
  final String subtitle;
  final String otherData;

  const CardComponent({
    super.key,
    required this.data,
    this.tittle = '',
    this.subtitle = '',
    this.otherData = '',
  });

  Color _getStatusColor() {
    String status = data['estado'] ?? '';
    switch (status) {
      case 'disponible':
        return Colors.green.shade100;
      case 'Reservado':
        return Colors.orange.shade100;
      case 'mantenimiento':
        return Colors.red.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: _getStatusColor(),
                width: 4,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Add this to prevent expansion
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        data['id'].toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow
                            .ellipsis, // Add this to handle text overflow
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Tipo: ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Expanded(
                      child: Text(
                        data['tipo'] ?? '',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Capacidad: ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Expanded(
                      child: Text(
                        data['capacidad']?.toString() ?? '',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 8.0,
                        children: (data['comodidades'] as List<String>)
                            .map((comodidad) {
                          switch (comodidad) {
                            case 'wifi':
                              return const Icon(Icons.wifi);
                            case 'jacuzzi':
                              return const Icon(Icons.hot_tub);
                            // Agrega más casos según las comodidades disponibles
                            default:
                              return const Icon(Icons.help_outline);
                          }
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Ver detalles'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
