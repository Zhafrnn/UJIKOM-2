import '../models/cart_model.dart';
import 'package:flutter/material.dart';

CartModel cart = CartModel();

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(String name, double price) {
    final index =
        _items.indexWhere((item) => item.name == name);

    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(name: name, price: price));
    }

    notifyListeners();
  }

  void increaseQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(CartItem item) {
    item.quantity--;
    if (item.quantity <= 0) {
      _items.remove(item);
    }
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(
        0,
        (sum, item) =>
            sum + (item.price * item.quantity));
  }

  int get totalItems {
    return _items.fold(
        0, (sum, item) => sum + item.quantity);
  }
}
