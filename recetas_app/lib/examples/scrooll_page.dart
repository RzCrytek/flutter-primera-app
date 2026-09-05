import 'package:flutter/material.dart';

class ScroollPage extends StatelessWidget {
  const ScroollPage({super.key});
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
      appBar: AppBar(title: Text("ScrollPage")),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("Cabecera 1"),
            Text("Cabecera 1"),
            Text("Cabecera 1"),
            Text("Cabecera 1"),
            Expanded(
              child: SingleChildScrollView(
                // scrollDirection: Axis.horizontal, //Scroll horizontal, funciona con un child Row
                child: Column(
                  children: [
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    _buildContainer("1"),
                    ...List.generate(100, (index) {
                      print(index);
                      return _buildContainer(index.toString());
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
