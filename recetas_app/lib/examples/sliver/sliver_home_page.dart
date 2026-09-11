import 'package:flutter/material.dart';
import 'package:recetas_app/examples/custom_scroll_tab.dart';

class SliverHomePage extends StatelessWidget {
  const SliverHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ejemplos de sliver"),
          bottom: TabBar(tabs: [Text("Custom"), Text("nada")]),
        ),
        body: TabBarView(children: [CustomScrollTab(), Scaffold()]),
      ),
    );
  }
}
