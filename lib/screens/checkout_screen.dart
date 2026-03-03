import 'package:flutter/material.dart';
import '../data/cart_data.dart';
import '../data/order_data.dart';
import '../models/order_model.dart';
import 'main_screen.dart';

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
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];

                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        8,
                      ), // tingkat kelengkungan
                      child: Image.asset(
                        item.imagePath,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Subtotal"),
                Text("\$${subtotal.toStringAsFixed(2)}"),
              ],
            ),

            const SizedBox(height: 8),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Delivery Fee"), Text("\$5.00")],
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
                      items: cart.items.map((item) {
                        return CartItem(
                          name: item.name,
                          price: item.price,
                          imagePath: item.imagePath,
                          quantity: item.quantity,
                        );
                      }).toList(),
                      total: total,
                      date: DateTime.now(),
                    ),
                  );

                  cart.clearCart();

                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => const MainScreen(initialIndex: 3),
                    ),
                    (route) => false,
                  );
                },
                child: const Text(
                  "Place Order",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
