import 'package:flutter/material.dart';
import '../data/cart_data.dart';
import '../data/order_data.dart';
import '../models/order_model.dart';
import 'package:restaurant_mobile_app/screens/main_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double deliveryFee = 5.0;
    final double subtotal = cart.totalPrice;
    final double total = subtotal + deliveryFee;

    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔥 Order List
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];

                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text("x${item.quantity}"),
                    trailing: Text(
                      "\$${(item.price * item.quantity).toStringAsFixed(2)}",
                    ),
                  );
                },
              ),
            ),

            const Divider(),

            // 🔥 Summary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Subtotal"),
                Text("\$${subtotal.toStringAsFixed(2)}"),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("Delivery Fee"), Text("\$5.00")],
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${total.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  if (cart.items.isEmpty) return;

                  orderData.addOrder(
                    OrderModel(
                      items: List.from(cart.items),
                      total: total,
                      date: DateTime.now(),
                    ),
                  );

                  cart.clearCart();

                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) =>
                          MainScreen(initialIndex: 3), // 3 = Orders tab
                    ),
                    (route) => false,
                  );
                },

                child: const Text("Place Order"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
