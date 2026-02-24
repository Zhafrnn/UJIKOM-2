import 'package:flutter/material.dart';
import '../widgets/restaurant_card.dart';
import 'restaurant_detail_screen.dart';
import 'package:restaurant_mobile_app/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = "";

  final List<Map<String, dynamic>> restaurants = [
    {
      "name": "McDonald's",
      "category": "Burger",
      "priceRange": "\$10 - \$50",
      "rating": 4.5,
    },
    // BISA DITAMBAHKAN SENDIRI
    
  ];

  @override
  Widget build(BuildContext context) {
    final filteredRestaurants = restaurants.where((restaurant) {
      final name = restaurant["name"].toString().toLowerCase();
      final category = restaurant["category"].toString().toLowerCase();
      return name.contains(searchQuery.toLowerCase()) ||
          category.contains(searchQuery.toLowerCase());
    }).toList();

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // 🔹 HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Deliver to", style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 4),
                      Text(
                        "New York, USA",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProfileScreen(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 28,
                      backgroundColor: Color(0xFFE0E0E0),
                      child: Icon(
                        Icons.person,
                        size: 28,
                        color: Color(0xFF5E35B1),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 SEARCH BAR
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search restaurant...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 PROMO BANNER
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF7043), Color(0xFFFF5722)],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Special Offer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Get 30% discount today",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _categoryItem("Burger", Icons.lunch_dining),
                    _categoryItem("Pizza", Icons.local_pizza),
                    _categoryItem("Drinks", Icons.local_drink),
                    _categoryItem("Dessert", Icons.icecream),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                "Popular Restaurants",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              // 🔥 RESTAURANT LIST (FILTERED)
              if (filteredRestaurants.isEmpty) ...[
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.search_off,
                        size: 60,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "No restaurants found",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ] else ...[
                ...filteredRestaurants.map((restaurant) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: RestaurantCard(
                      name: restaurant["name"],
                      category: restaurant["category"],
                      priceRange: restaurant["priceRange"],
                      rating: restaurant["rating"],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RestaurantDetailScreen(),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ],

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryItem(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}
