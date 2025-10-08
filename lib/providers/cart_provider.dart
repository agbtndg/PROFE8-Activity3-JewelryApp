import 'package:flutter/material.dart';
import 'package:jewel_form/models/cart_item.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];
  int _jewelryCount = 0;

  List<CartItem> get items => _items;
  int get jewelryCount => _jewelryCount;

  void addItem(String name, String material) {
    _items.add(CartItem(
      id: DateTime.now().toString(),
      name: name,
      material: material,
    ));
    _jewelryCount++;
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    _jewelryCount--;
    notifyListeners();
  }

  void clearCart() {
    _items = [];
    _jewelryCount = 0;
    notifyListeners();
  }

  void incrementCount() {
    _jewelryCount++;
    notifyListeners();
  }

  void decrementCount() {
    if (_jewelryCount > 0) {
      _jewelryCount--;
      notifyListeners();
    }
  }
}