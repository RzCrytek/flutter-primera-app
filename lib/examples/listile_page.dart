import 'package:flutter/material.dart';

class ListilePage extends StatefulWidget {
  @override
  State<ListilePage> createState() => _ListilePageState();
}

class _ListilePageState extends State<ListilePage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text("Usuario"),
              subtitle: Text(
                "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library in London, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has ",
                maxLines: 2,
              ),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                print("Tocado");
                isSelected = !isSelected;
                setState(() {});
              },
              onLongPress: () {
                print("Mantener presionado");
              },
              dense:
                  false, //redude la altura del item, y lo vuelve mas compacto
              contentPadding: EdgeInsets.all(32),
              selected:
                  isSelected, //vuelve al listile en un estilo de seleccion y para elo se le coloca el valor de la variable is selected
              selectedColor: Colors.red,
              isThreeLine: false, // se usa cuando subtitle tiene mucho texto
              enabled: true, //habilita o deshabiltia la interacción
              tileColor: Colors.grey,
              selectedTileColor:
                  Colors.green, //color de fondo cuando esta seleccionado
            ),
          ],
        ),
      ),
    );
  }
}
