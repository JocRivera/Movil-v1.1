import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Alojamiento.dart';

class GetAlojamientos {
  static Future<List<Alojamiento>> fetch() async {
    final response =
        await http.get(Uri.parse('https://localhost:7025/alojamientoes'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Alojamiento.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los alojamientos');
    }
  }
}
