import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatelessWidget {
  final String query;
  const SearchPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("Texto buscado:", style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text(query, style: TextStyle(fontSize: 30, fontWeight: .bold)),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.go("/"),
              child: Text("Volver al inicio"),
            ),
          ],
        ),
      ),
    );
  }
}
