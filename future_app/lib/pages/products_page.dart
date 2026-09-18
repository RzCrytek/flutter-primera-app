import 'package:flutter/material.dart';
import 'package:future_app/models/product_model.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late Future<List<ProductModel>> productsFuture;

  Future<List<ProductModel>> obtenerProductos() async {
    await Future.delayed(Duration(seconds: 2));

    return [
      ProductModel(nombre: "Laptop Lenovo", precio: 2500.00, stock: 5),
      ProductModel(nombre: "Mouse", precio: 80.20, stock: 15),
      ProductModel(nombre: "Teclado mecánico", precio: 180.00, stock: 10),
      ProductModel(nombre: "Monitos Samsung", precio: 750.60, stock: 3),
    ];
  }

  @override
  void initState() {
    productsFuture = obtenerProductos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: FutureBuilder<List<ProductModel>>(
        future: productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Ocurrió un error: ${snapshot.error}'));
          }

          final products = snapshot.data!;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return ListTile(
                title: Text(product.nombre),
                subtitle: Text(
                  'Precio: S/ ${product.precio} | Stock: ${product.stock}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
