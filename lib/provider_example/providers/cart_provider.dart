import 'package:flutter/material.dart';
import 'package:proyectos/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductModel> _items = [];

  List<ProductModel> get items => List.unmodifiable(_items);

  double getTotalPrice() {
    double total = 0;
    for (final product in _items) {
      total += product.precio;
    }
    return total;
  }

  void addProduct(ProductModel product) {
    _items.add(product);
    notifyListeners();
  }

  void removeProduct(ProductModel product) {
    _items.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
