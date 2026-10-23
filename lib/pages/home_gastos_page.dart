import 'package:flutter/material.dart';
import 'package:proyectos/database/db_helper_expenses.dart';
import 'package:proyectos/generated/l10n.dart';
import 'package:proyectos/models/expense_model.dart';
import 'package:proyectos/main.dart';
import 'package:proyectos/widgets/register_modal_widget.dart';

class HomeGastosPage extends StatefulWidget {
  const HomeGastosPage({super.key});

  @override
  State<HomeGastosPage> createState() => _HomeGastosPageState();
}

class _HomeGastosPageState extends State<HomeGastosPage> {
  final _dbHelper = DbHelperExpenses();
  late Future<List<Expense>> _expensesFuture;

  @override
  void initState() {
    super.initState();
    _expensesFuture = _dbHelper.getExpenses();
  }

  Future<void> showRegisterModal() async {
    final added = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const RegisterModalWidget();
      },
    );
    if (added == true && mounted) {
      setState(() {
        _expensesFuture = _dbHelper.getExpenses();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final texts = S.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Resumen de gastos",
            style: TextStyle(fontSize: 22, fontWeight: .bold),
          ),
          actions: [
            PopupMenuButton<Locale>(
              icon: Icon(Icons.language),
              onSelected: (locale) {
                MyApp.setLocale(context, locale);
              },
              itemBuilder: (context) => [
                PopupMenuItem(value: Locale("es"), child: Text("Español")),
                PopupMenuItem(value: Locale("en"), child: Text("English")),
              ],
            ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: .end,
              children: [
                GestureDetector(
                  onTap: () {
                    showRegisterModal();
                  },
                  child: Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: 110,
                    child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        Icon(Icons.add, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "Agregar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          texts.appTitle,
                          style: TextStyle(fontSize: 22, fontWeight: .bold),
                        ),
                        Text(S.of(context).welcome),
                        Text(texts.helloAlguien("Jhonny Gallegos")),
                        Text(
                          "Gestiona tus gastos de la mejor forma",
                          style: TextStyle(color: Colors.grey),
                        ),

                        Expanded(
                          child: FutureBuilder<List<Expense>>(
                            future: _expensesFuture,
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                    "No se pudieron cargar los gastos: ${snapshot.error}",
                                  ),
                                );
                              }
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final expenses = snapshot.data!;
                              if (expenses.isEmpty) {
                                return const Center(
                                  child: Text(
                                    "Aún no tienes gastos registrados.",
                                  ),
                                );
                              }
                              return ListView.builder(
                                itemCount: expenses.length,
                                itemBuilder: (context, index) {
                                  final expense = expenses[index];
                                  final date =
                                      "${expense.date.year}-${expense.date.month.toString().padLeft(2, "0")}-${expense.date.day.toString().padLeft(2, "0")}";
                                  return Card(
                                    child: ListTile(
                                      title: Text(
                                        expense.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "$date · ${expense.categoryName}",
                                      ),
                                      trailing: Text(
                                        "S/ ${expense.amount.toStringAsFixed(2)}",
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      leading: Image.asset(
                                        "assets/icons/${expense.categoryImage}.webp",
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 90),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
