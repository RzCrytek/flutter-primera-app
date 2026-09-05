import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Página no encontrada")),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Icon(Icons.error_outline, size: 80, color: Colors.red),
            SizedBox(height: 20),
            Text("404", style: TextStyle(fontSize: 40, fontWeight: .bold)),
            SizedBox(height: 30),
            Text(
              "La ruta solicitada no existe",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                context.go("/");
              },
              child: Text("Volver al inicio"),
            ),
          ],
        ),
      ),
    );
  }
}
