class DeportModel {
  String nombre;
  bool isFavorite;

  DeportModel({required this.nombre, this.isFavorite = false});
}

List<DeportModel> deportList = [
  DeportModel(nombre: "Gimnasia"),
  DeportModel(nombre: "Crossfit"),
  DeportModel(nombre: "Baloncesto"),
  DeportModel(nombre: "Natación"),
  DeportModel(nombre: "Golf"),
  DeportModel(nombre: "Tenis"),
  DeportModel(nombre: "Balonmano"),
];
