class PersonaModel {
  String nombre;
  String apellido;
  String direccion;
  String? dni;
  String nacionalidad;

  PersonaModel({
    required this.nombre,
    required this.apellido,
    required this.direccion,
    this.dni,
    this.nacionalidad = "Peruan@",
  });
}

PersonaModel persona1 = PersonaModel(
  nombre: "Jhonny",
  apellido: "Gallegos",
  direccion: "Av 123, 23",
);
