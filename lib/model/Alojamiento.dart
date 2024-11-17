class Alojamiento {
  final int id;
  final int idTipo;
  final int capacidad;
  final bool estado;
  Alojamiento({
    required this.id,
    required this.idTipo,
    required this.capacidad,
    required this.estado,
  });

  factory Alojamiento.fromJson(Map<String, dynamic> json) {
    return Alojamiento(
      id: json['idAloamiento'],
      idTipo: json['idTipo'],
      capacidad: json['capacidad'],
      estado: json['estado'],
    );
  }

  Map<String, String> toGridItem() {
    return {
      'id': id.toString(),
      'nombre': 'Alojamiento $id',
      'capacidad': capacidad.toString(),
      'estado': estado ? 'Disponible' : 'Mantenimiento',
    };
  } // manejamos la informacion de los alojamientos en un objeto de tipo Alojamiento
}
