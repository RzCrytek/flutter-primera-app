import 'package:flutter/material.dart';

class SliverFixedExtentlistTab extends StatelessWidget {
  const SliverFixedExtentlistTab({super.key});

  // Cuando todos los elementos tienen la misma altura, podemos usar SliverFixedExtentList para optimizar el scroll
  // Ventajas -> flutter ya no sabe la altura, el cálculo de sliverlist es más rápido, no se necesita medi el widget para saber cuándo ocupa

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Text("Fixed Extent Fijo (Alto fijo)"),
        ),
        SliverFixedExtentList(
          //  itemExtent  -> define el alto extacto de cada item, optimiza el layout
          itemExtent: 120,
          delegate: SliverChildBuilderDelegate(childCount: 60, (
            context,
            index,
          ) {
            return Container(
              alignment: Alignment.center,
              // ya no es necesario colocar la altura, porque lo define el sliver
              color: index.isEven ? Colors.indigo : Colors.teal,
              child: ListTile(
                leading: Icon(Icons.height),
                title: Text("Fila con altura fija: $index"),
                subtitle: Text("Rinde mejor que un sliver list en este caso"),
              ),
            );
          }),
        ),
      ],
    );
  }
}
