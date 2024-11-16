import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final Map<String, dynamic> data;
  const CardComponent({
    super.key,
    required this.data,
  });
  Color _getStatusColor() {
    String status = data['estado'] ?? '';
    switch (status) {
      case 'Disponible':
        return Colors.green;
      case 'Reservado':
        return Colors.orange;
      case 'No disponible':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  data['nombre'] ?? '',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )),
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
            Text(
              data['direccion'] ?? '',
              style: const TextStyle(fontSize: 14),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Reservar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
