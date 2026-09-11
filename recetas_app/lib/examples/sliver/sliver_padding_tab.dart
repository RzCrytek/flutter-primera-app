import 'package:flutter/material.dart';

class SliverPaddingTab extends StatelessWidget {
  const SliverPaddingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverPersistentHeader -> Permite crear un encabezado que puede quedarse visiblemente mientras hacemos scroll
        SliverPersistentHeader(delegate: MyHeaderDelegate()),

        // SliverPadding  -> siver para agregar espacios a un sliver
        SliverPadding(
          padding: EdgeInsets.all(32),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(childCount: 20, (
              context,
              index,
            ) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text("Categoría: ${index + 1}"),
              );
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
          ),
        ),

        // SliverFillRemaining -> permite que un widget ocupe el espacio restante de la pantalla
        // Nos ayuda cuando la pantalla tiene poco contenido y queremos que el mensajenfinal se vea centrado
        SliverFillRemaining(
          hasScrollBody:
              false, //indica que el contenido no necesita su propio scroll interno
          child: Center(
            child: Text("No hay mas contenido", style: TextStyle(fontSize: 25)),
          ),
        ),
      ],
    );
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlasContent) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("My header"),
    );
  }

  @override
  double get maxExtent => 120; //altura máxima

  double get minExtent => 60; //altura mínim

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
