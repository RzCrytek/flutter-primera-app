class Expense {
  const Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
  });

  final int id;
  final String title;
  final double amount;
  final DateTime date;
  final int categoryId;
  final String categoryName;
  final String categoryImage;

  factory Expense.fromMap(Map<String, Object?> map) {
    return Expense(
      id: map["id"] as int,
      title: map["nombre"] as String,
      amount: (map["monto"] as num).toDouble(),
      date: DateTime.parse(map["fecha"] as String),
      categoryId: map["categoria_id"] as int,
      categoryName: map["categoria_nombre"] as String,
      categoryImage: map["categoria_imagen"] as String,
    );
  }
}
