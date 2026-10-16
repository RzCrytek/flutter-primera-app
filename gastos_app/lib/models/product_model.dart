class ProductModel {
  final int? id;
  final String nombre;
  final double precio;
  final int stock;

  ProductModel({
    this.id,
    required this.nombre,
    required this.precio,
    required this.stock,
  });

  Map<String, dynamic> toMap() {
    return {"id": id, "nombre": nombre, "precio": precio, "stock": stock};
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map["id"],
      nombre: map["nombre"],
      precio: map["precio"],
      stock: map["stock"],
    );
  }
}
