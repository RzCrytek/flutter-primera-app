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
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          // scrollDirection: Axis.horizontal, //trabajar el scroll en horizontal y colocar como hijo a un row
          child: Column(
            mainAxisAlignment: .center,
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
            ],
          ),
        ),
      ),
    );
  }
}
