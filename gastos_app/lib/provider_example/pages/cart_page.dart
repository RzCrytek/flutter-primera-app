import 'package:flutter/material.dart';
import 'package:gastos_app/provider_example/providers/cart_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Mi carrito")),
      body: cartProvider.items.isEmpty
          ? Center(
              child: Text(
                "Tu carrito esta vacio",
                style: TextStyle(fontSize: 22),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: cartProvider.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product = cartProvider.items[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.inventory_2),
                          title: Text(product.nombre),
                          subtitle: Text("S/ ${product.precio}"),
                          trailing: IconButton(
                            onPressed: () {
                              context.read<CartProvider>().removeProduct(
                                product,
                              );
                            },
                            icon: Icon(Icons.remove),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Ejemplo con selector
                Container(
                  padding: EdgeInsets.all(32),
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  // Ejempl0o normal
                  // child: Text(
                  //   "Total: S/${cartProvider.getTotalPrice().toStringAsFixed(2)}",
                  //   style: TextStyle(fontSize: 24, fontWeight: .bold),
                  // ),

                  // Ejemplo con selector
                  child: Selector<CartProvider, double>(
                    selector: (context, cartProvider) =>
                        cartProvider.getTotalPrice(),
                    builder: (context, totalPrice, child) {
                      return Text(
                        "Total: S/${cartProvider.getTotalPrice().toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 24, fontWeight: .bold),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
