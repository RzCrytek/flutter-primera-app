import 'package:flutter/material.dart';

class SliverListBuildTab extends StatelessWidget {
  SliverListBuildTab({super.key});

  final int cantidad = 45;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: Container(),
          pinned: true,
          expandedHeight: 140,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("bUILD perezoso"),
            collapseMode: CollapseMode.parallax,
          ),
        ),

        SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                print(index);
                bool esPar = index % 2 == 0;

                return Card(
                  color: esPar ? Colors.blue : Colors.green,
                  child: ListTile(
                    leading: CircleAvatar(child: Text("${index + 1}")),
                    title: Text("Producto: ${index * 10}"),
                    subtitle: Text("Contruyendo bajo demanda"),
                    trailing: Icon(esPar ? Icons.star : Icons.circle),
                  ),
                );
              },
              childCount: cantidad,
              addRepaintBoundaries: true,
              addSemanticIndexes: true,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text("Find del builder"),
          ),
        ),
      ],
    );
  }
}
