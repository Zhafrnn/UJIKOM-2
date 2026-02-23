import 'package:restaurant_mobile_app/models/cart_model.dart';

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
