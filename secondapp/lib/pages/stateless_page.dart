import 'package:flutter/material.dart';

class StatelessPage extends StatelessWidget {
  String nombre;

  StatelessPage({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("StatelessWidget")),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("Hola soy $nombre"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                nombre = 'Quora';
              },
              child: Text("Modificar nombre"),
            ),
          ],
        ),
      ),
    );
  }
}
