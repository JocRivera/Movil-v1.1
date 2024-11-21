class Alojamiento {
  final int id;
  final String? tipo;
  final int? capacidad;
  final String? estado;
  final List<String>? comodidades;
  Alojamiento({
    required this.id,
    this.tipo,
    this.capacidad,
    this.estado,
    this.comodidades,
  });
  factory Alojamiento.fromJson(Map<String, dynamic> json) {
    return Alojamiento(
      id: json['idAlojamiento'],
      tipo: json['tipo'],
      capacidad: json['capacidad'],
      estado: json['estado'],
      comodidades:
          json['comodidad'] != null ? List<String>.from(json['comodidad']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tipo': tipo,
      'capacidad': capacidad,
      'estado': estado,
      'comodidades': comodidades,
    };
  }
}
