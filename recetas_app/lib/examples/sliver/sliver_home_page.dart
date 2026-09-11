import 'package:flutter/material.dart';
import 'package:recetas_app/examples/custom_scroll_tab.dart';
import 'package:recetas_app/examples/sliver/sliver_grid_tab.dart';
import 'package:recetas_app/examples/sliver/sliver_padding_tab.dart';

class SliverHomePage extends StatelessWidget {
  const SliverHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ejemplos de sliver"),
          bottom: TabBar(tabs: [Text("Custom"), Text("Grid"), Text("Padding")]),
        ),
        body: TabBarView(
          children: [CustomScrollTab(), SliverGridTab(), SliverPaddingTab()],
        ),
      ),
    );
  }
}
