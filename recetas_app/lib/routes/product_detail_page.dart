import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends StatelessWidget {
  final String productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Detail Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("Producto seleccionado: ", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(
              "Id: $productId",
              style: TextStyle(fontSize: 32, fontWeight: .bold),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // context.go("/products");
                context.pop();
              },
              child: Text("Volver a productos"),
            ),
          ],
        ),
      ),
    );
  }
}
