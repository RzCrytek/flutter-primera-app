import 'package:flutter/material.dart';

class SliverGridTab extends StatelessWidget {
  const SliverGridTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverGrid(
          // delegate -> Define qué es lo que se va a construir, en este caso Cards
          delegate: SliverChildBuilderDelegate((context, index) {
            return Card(
              color: Colors.cyan,
              child: Center(child: Text("Index. ${index + 1}")),
            );
          }),
          // gridDelegate -> Define cómo lo va a construir
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //número de columnas
            mainAxisSpacing: 10, //espaciado vertical entre elementos
            crossAxisSpacing: 15, //espaciado horizontal entre elementos
            childAspectRatio:
                1.2, //Controla la proporcion entre el ancho y el alto de cada elemento
          ),
        ),
      ],
    );
  }
}
