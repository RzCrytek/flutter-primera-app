import 'package:flutter/material.dart';
import 'package:gastos_app/database/db_helper_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DbHelperProducts dbHelperProducts = DbHelperProducts();
          // dbHelperProducts.initDatabase();
          dbHelperProducts.insertProduct("Audífonos", 650.50, 10);
          // dbHelperProducts.actualizarProducto(2, "Tablet");
          // dbHelperProducts.eliminarProducto(6);

          dbHelperProducts.obtenerProductos().then((productos) {
            productos.forEach((producto) {
              print(producto);
            });
          });
        },
      ),
    );
  }
}
