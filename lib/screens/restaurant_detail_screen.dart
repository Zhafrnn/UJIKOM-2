import 'package:flutter/material.dart';
import '../widgets/food_card.dart';
import 'food_detail_screen.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String name;
  final String category;
  final double rating;
  final String priceRange;
  final String imagePath;

  const RestaurantDetailScreen({
    super.key,
    required this.name,
    required this.category,
    required this.rating,
    required this.priceRange,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔥 BACK BUTTON
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              // 🔥 HEADER IMAGE
              Image.asset(
                imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 16),

              // 🔥 RESTAURANT INFO
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "$category • ${rating.toStringAsFixed(1)} ⭐ • $priceRange",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔥 CATEGORY MINI TAB
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _miniCategory("Burger", true),
                    _miniCategory("Drinks", false),
                    _miniCategory("Dessert", false),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔥 FOOD GRID (TIDAK SCROLL SENDIRI)
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true, // ✅ penting
                physics: const NeverScrollableScrollPhysics(), // ✅ penting
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return FoodCard(
                    name: "Super Burger",
                    price: "\$12",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FoodDetailScreen(),
                        ),
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _miniCategory(String title, bool isActive) {
  return Padding(
    padding: const EdgeInsets.only(right: 12),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isActive ? Colors.orange : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
