import 'package:flutter/material.dart';
import 'package:jewel_form/models/cart_item.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(String name, String material) {
    _items.add(CartItem(
      id: DateTime.now().toString(),
      name: name,
      material: material,
    ));
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void clearCart() {
    _items = [];
    notifyListeners();
  }
}