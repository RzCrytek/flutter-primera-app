import 'package:flutter/material.dart';
import 'package:proyectos/generated/l10n.dart';
import 'package:proyectos/main.dart';
import 'package:proyectos/widgets/register_modal_widget.dart';

class HomeGastosPage extends StatefulWidget {
  HomeGastosPage({super.key});

  @override
  State<HomeGastosPage> createState() => _HomeGastosPageState();
}

class _HomeGastosPageState extends State<HomeGastosPage> {
  void showRegisterModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return RegisterModalWidget();
      },
    );
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

                        Card(
                          child: ListTile(
                            title: Text(
                              "Cine",
                              style: TextStyle(fontWeight: .bold),
                            ),
                            subtitle: Text("2026-10-10"),
                            trailing: Text(
                              "S/ 12.0",
                              style: TextStyle(fontSize: 16),
                            ),

                            leading: Image.asset(
                              "assets/icons/bancos.webp",
                              width: 40,
                              height: 40,
                            ),
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
