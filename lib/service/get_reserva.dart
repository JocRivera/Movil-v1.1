import 'dart:convert';
import 'package:http/http.dart' as http;

class GetReserva {
  Future<List<Map<String, dynamic>>> fetchReservations() async {
    final response = await http.post(
      Uri.parse('https://localhost:7025/reservas'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{}),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => item as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load reservations');
    }
  }
}
