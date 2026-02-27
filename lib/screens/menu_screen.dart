import 'package:flutter/material.dart';
import '../widgets/food_card.dart';
import 'package:restaurant_mobile_app/models/food_item_model.dart';
import '../data/food_data.dart';

class MenuScreen extends StatelessWidget {
  final String category;

  const MenuScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<FoodItem> filteredFoods = allFoods
        .where((food) => food.category == category)
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: filteredFoods.isEmpty
          ? const Center(
              child: Text("No menu available", style: TextStyle(fontSize: 16)),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredFoods.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final food = filteredFoods[index];
                return FoodCard(
                  name: food.name,
                  price: food.price,
                  onTap: () {},
                );
              },
            ),
    );
  }
}
