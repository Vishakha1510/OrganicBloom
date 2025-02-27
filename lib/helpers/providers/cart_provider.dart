import 'package:flutter/material.dart';
import 'package:organicbloom/model/cart_model.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalAmount {
    return _items.values.fold(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  void addToCart(
      String id, String name, double price, int quantity, String image) {
    if (_items.containsKey(id)) {
      _items[id]!.quantity += quantity;
    } else {
      _items[id] = CartItem(
        id: id,
        name: name,
        price: price,
        quantity: quantity,
        image: image, // Store image
      );
    }
    notifyListeners();
  }

  void removeFromCart(String id) {
    if (_items.containsKey(id)) {
      if (_items[id]!.quantity > 1) {
        _items[id]!.quantity -= 1;
      } else {
        _items.remove(id);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
