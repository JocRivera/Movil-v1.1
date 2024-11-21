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
        return Colors.orange;
      case 'mantenimiento':
        return Colors.red.shade100;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    data['estado'] ?? '',
                    style: const TextStyle(fontSize: 12),
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
                    children:
                        (data['comodidades'] as List<String>).map((comodidad) {
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
    );
  }
}
