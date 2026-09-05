import 'package:flutter/material.dart';

class ListviewPage extends StatelessWidget {
  const ListviewPage({super.key});
  Widget _buildContainer(String text) {
    return Container(
      width: 200,
      height: 50,
      color: Colors.red,
      margin: EdgeInsets.all(16),
      child: Center(child: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listview Page")),
      body: Center(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) =>
              Divider(thickness: 4, color: Colors.blueAccent),
          itemCount: 1000,
          itemBuilder: (context, index) => _buildContainer(index.toString()),
        ),

        // ListView.builder(
        //   // scrollDirection: Axis.horizontal,
        //   itemCount: 1000,
        //   itemBuilder: (BuildContext context, int index) {
        //     print(index);
        //     return _buildContainer(index.toString());
        //   },
        // ),

        // ListView(
        //   scrollDirection: Axis.horizontal,
        //   children: [
        //     Text("Cabecera 1"),
        //     Text("Cabecera 1"),
        //     Text("Cabecera 1"),
        //     Text("Cabecera 1"),
        //     _buildContainer("1"),
        //     _buildContainer("1"),
        //     _buildContainer("1"),
        //     _buildContainer("1"),
        //     _buildContainer("1"),
        //     _buildContainer("1"),
        //     _buildContainer("1"),
        //     _buildContainer("1"),
        //     _buildContainer("1"),
        //     _buildContainer("1"),
        //     _buildContainer("1"),
        //     _buildContainer("1"),
        //     _buildContainer("1"),
        //     _buildContainer("1"),
        //   ],
        // ),
      ),
    );
  }
}
