import "package:path/path.dart";
import "package:path_provider/path_provider.dart";
import "package:proyectos/models/expense_model.dart";
import "package:sqflite/sqflite.dart";

class DbHelperExpenses {
  Future<Database> initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final pathDatabase = join(directory.path, "ExpensesDB.db");

    return openDatabase(
      pathDatabase,
      version: 1,
      onCreate: (db, version) async {
        await db.execute("""
          CREATE TABLE gastos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT NOT NULL,
            monto REAL NOT NULL,
            fecha TEXT NOT NULL,
            categoria_id INTEGER NOT NULL,
            categoria_nombre TEXT NOT NULL,
            categoria_imagen TEXT NOT NULL
          )
        """);
      },
    );
  }

  Future<int> insertExpense({
    required String title,
    required double amount,
    required DateTime date,
    required int categoryId,
    required String categoryName,
    required String categoryImage,
  }) async {
    final db = await initDatabase();
    return db.insert("gastos", {
      "nombre": title,
      "monto": amount,
      "fecha": date.toIso8601String(),
      "categoria_id": categoryId,
      "categoria_nombre": categoryName,
      "categoria_imagen": categoryImage,
    });
  }

  Future<List<Expense>> getExpenses() async {
    final db = await initDatabase();
    final rows = await db.query("gastos", orderBy: "id DESC");
    return rows.map(Expense.fromMap).toList();
  }
}
