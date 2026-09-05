import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final List<Map<String, dynamic>> products = [
    {"id": 1, "name": "Laptop Gamer"},
    {"id": 2, "name": "Mouse Inalámbrico"},
    {"id": 3, "name": "Teclado Mecánico"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products Page ")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: CircleAvatar(child: Text(product["id"].toString())),
            title: Text(product["name"]),
            subtitle: Text("Toca para ver el detalle"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // context.go("/products/${product['id']}");
              context.push("/products/${product['id']}");
            },
          );
        },
      ),
    );
  }
}
