import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/food_card.dart';
import 'food_detail_screen.dart';
import 'package:restaurant_mobile_app/models/food_item_model.dart';
import 'package:restaurant_mobile_app/data/food_data.dart';

class RestaurantDetailScreen extends StatefulWidget {
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
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  String selectedCategory = "All";

  // =========================
  // FILTER LOGIC
  // =========================
  List<FoodItem> get filteredFoods {
    if (selectedCategory == "All") {
      return allFoods; // dari food_data.dart
    }

    return allFoods
        .where(
          (food) =>
              food.category.toLowerCase() == selectedCategory.toLowerCase(),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // =========================
          // HEADER
          // =========================
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(widget.imagePath, fit: BoxFit.cover),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // =========================
          // RESTO INFO + CATEGORY
          // =========================
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "${widget.category} • ${widget.rating.toStringAsFixed(1)} ⭐ • ${widget.priceRange}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),

                  // CATEGORY LIST
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _miniCategory("All"),
                        _miniCategory("Burger"),
                        _miniCategory("Pizza"),
                        _miniCategory("Drinks"),
                        _miniCategory("Dessert"),
                        _miniCategory("Chicken"),
                        _miniCategory("Coffee"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // =========================
          // EMPTY STATE
          // =========================
          if (filteredFoods.isEmpty)
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.fastfood_outlined, size: 60, color: Colors.grey),
                    SizedBox(height: 12),
                    Text(
                      "No food available",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          else
            // =========================
            // GRID MAKANAN
            // =========================
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final food = filteredFoods[index];

                  return FoodCard(
                    name: food.name,
                    price: food.price,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FoodDetailScreen(),
                        ),
                      );
                    },
                  );
                }, childCount: filteredFoods.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // =========================
  // MINI CATEGORY BUTTON
  // =========================
  Widget _miniCategory(String title) {
    final bool isActive = selectedCategory == title;

    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = title;
          });
        },
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
      ),
    );
  }
}
