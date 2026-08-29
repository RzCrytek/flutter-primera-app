import 'package:flutter/material.dart';

class ExpansionTilePage extends StatelessWidget {
  const ExpansionTilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExpansionTile(
              title: Text("Título"), //texto o widget principal que se siempre
              subtitle: Text("Subtitulo"),
              leading: Icon(Icons.person),
              // trailing: Icon(Icons.abc),
              initiallyExpanded: true, //indicar que inicie expandido
              onExpansionChanged: (bool isOpen) {
                print("Esta abierto?: $isOpen");
              },
              collapsedBackgroundColor:
                  Colors.red, //color del expansion cuando esta cerrado
              backgroundColor: Colors.blue, //color de fondo
              iconColor: Colors.cyan,
              textColor: Colors.yellow,
              children: [
                ListTile(title: Text("Elemento 1")),
                ListTile(title: Text("Elemento 2")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
