import 'package:flutter/material.dart';
import '../models/food_item_model.dart';
import '../data/cart_data.dart';

class FoodDetailScreen extends StatelessWidget {
  final FoodItem food;

  const FoodDetailScreen({super.key, required this.food});

  double _parsePrice(String price) {
    return double.parse(price.replaceAll("\$", ""));
  }

  @override
  Widget build(BuildContext context) {
    final double priceValue = _parsePrice(food.price);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔹 BACK BUTTON
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            /// 🔹 IMAGE
            Container(
              height: 280,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: AssetImage(food.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// 🔹 DETAIL
            /// 🔹 DETAIL
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 🔸 RATING
                      Row(
                        children: const [
                          Icon(Icons.star, color: Colors.orange, size: 20),
                          Icon(Icons.star, color: Colors.orange, size: 20),
                          Icon(Icons.star, color: Colors.orange, size: 20),
                          Icon(Icons.star, color: Colors.orange, size: 20),
                          Icon(Icons.star_half, color: Colors.orange, size: 20),
                          SizedBox(width: 6),
                          Text(
                            "4.5 (120 reviews)",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      /// 🔸 NAMA MAKANAN
                      Text(
                        food.name,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// 🔸 HARGA
                      Text(
                        food.price,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// 🔸 DESKRIPSI PANJANG
                      const Text(
                        "This delicious menu is prepared using premium quality ingredients "
                        "and cooked to perfection. Every bite delivers rich flavor, "
                        "freshness, and satisfying texture. Perfect for lunch, dinner, "
                        "or whenever you're craving something truly special.\n\n"
                        "Our chefs carefully select the finest ingredients to ensure "
                        "the best taste experience for you. Served fresh and made with love.",
                        style: TextStyle(
                          color: Colors.grey,
                          height: 1.6,
                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),

            /// 🔹 ADD TO CART BUTTON
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
                    cart.addItem(food.name, priceValue, food.image);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${food.name} added to cart"),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  child: const Text(
                    "Add To Cart",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
