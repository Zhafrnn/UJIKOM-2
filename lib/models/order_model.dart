import '../data/cart_data.dart';

class OrderModel {
  final List<CartItem> items;
  final double total;
  final DateTime date;

  OrderModel({
    required this.items,
    required this.total,
    required this.date,
  });
}