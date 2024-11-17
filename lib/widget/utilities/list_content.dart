import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListContent extends StatelessWidget {
  final Map<String, dynamic> data;

  const ListContent({
    super.key,
    required this.data,
  });

  Color _getStatusColor() {
    String status = data['estado'] ?? '';
    switch (status) {
      case 'confirmada':
        return Colors.green.shade100;
      case 'pendiente':
        return Colors.orange;
      case 'cancelada':
        return Colors.red.shade100;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                data['cliente'] ?? 'Cliente desconocido',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                data['alojamiento'] ?? 'Alojamiento desconocido',
                style: Theme.of(context).textTheme.bodySmall,
              )
            ]),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getStatusColor(),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                data['estado'] ?? 'Estado desconocido',
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.calendar_today),
            const SizedBox(width: 8),
            Text(
              data['fechaInicio'] != null && data['fechaFin'] != null
                  ? '${DateFormat('MMM d').format(DateTime.parse(data['fechaInicio']))} - ${DateFormat('MMM d, yyyy').format(DateTime.parse(data['fechaFin']))}'
                  : 'Fechas desconocidas',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextButton.icon(
          icon: const Icon(Icons.info_outline),
          label: const Text('Ver detalles'),
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/details',
              arguments: data,
            );
          },
        )
      ]),
    );
  }
}
