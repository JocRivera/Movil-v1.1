import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Alojamiento.dart';

class GetAlojamientos {
  static Future<List<Alojamiento>> fetch() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/alojamiento'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print(data);
      return data.map((json) => Alojamiento.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los alojamientos');
    }
  }
}
