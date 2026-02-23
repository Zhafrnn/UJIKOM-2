import '../models/order_model.dart';

class OrderData {
  final List<OrderModel> _orders = [];

  List<OrderModel> get orders => _orders;

  void addOrder(OrderModel order) {
    _orders.add(order);
  }
}

final orderData = OrderData();
