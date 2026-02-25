import 'package:flutter/material.dart';
import '../data/saved_data.dart';
import '../widgets/restaurant_card.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void initState() {
    super.initState();
    saved.addListener(_update);
  }

  void _update() {
    setState(() {});
  }

  @override
  void dispose() {
    saved.removeListener(_update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = saved.items;

    return Scaffold(
      appBar: AppBar(title: const Text("My Favorite")),
      body: items.isEmpty
          ? const Center(child: Text("No saved items"))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return RestaurantCard(
                  name: item.name,
                  category: item.category,
                  priceRange: item.priceRange,
                  rating: item.rating,
                  imagePath: item.imagePath,
                  onTap: () {},
                );
              },
            ),
    );
  }
}
