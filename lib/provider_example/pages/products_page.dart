import 'package:flutter/material.dart';
import 'package:proyectos/models/product_model.dart';
import 'package:proyectos/provider_example/pages/cart_page.dart';
import 'package:proyectos/provider_example/pages/counter_page.dart';
import 'package:proyectos/provider_example/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final List<ProductModel> products = [
    ProductModel(id: 1, nombre: "Laptop", precio: 3500, stock: 3),
    ProductModel(id: 2, nombre: "Mouse", precio: 80, stock: 10),
    ProductModel(id: 3, nombre: "Teclado", precio: 150, stock: 1),
    ProductModel(id: 4, nombre: "Monitos", precio: 900, stock: 50),
    ProductModel(id: 5, nombre: "Audifonos", precio: 220, stock: 150),
  ];

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CounterPage()),
              );
            },
            icon: Icon(Icons.format_list_numbered_rounded),
          ),
          Stack(
            alignment: AlignmentGeometry.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                icon: Icon(Icons.shopping_cart),
              ),

              if (cartProvider.items.length > 0)
                Positioned(
                  right: 6,
                  top: 4,
                  child: CircleAvatar(
                    radius: 8,
                    //   Ejemplo 1 de consumo de info
                    // child: Text(
                    //   cartProvider.items.length.toString(),
                    //   style: TextStyle(fontSize: 12),
                    // ),

                    // Ejemplo 2 de consumo de info con CONSUMER
                    child: Consumer<CartProvider>(
                      builder: (context, value, child) {
                        return Text(
                          cartProvider.items.length.toString(),
                          style: TextStyle(fontSize: 12),
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.inventory_2),
              title: Text(product.nombre),
              subtitle: Text("S/ ${product.precio}"),
              trailing: IconButton(
                onPressed: () {
                  context.read<CartProvider>().addProduct(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${product.nombre} agregado correctamente"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                icon: Icon(Icons.add),
              ),
            ),
          );
        },
      ),
    );
  }
}
