import 'package:flutter/material.dart';
import '../widgets/restaurant_card.dart';
import 'restaurant_detail_screen.dart';
import 'profile_screen.dart';
import 'menu_screen.dart';

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
      "category": "Burger & Chicken",
      "priceRange": "\$25 - \$60",
      "rating": 4.5,
      "imagePath": "assets/Mc_Donald's.jpg",
    },
    {
      "name": "Burger King",
      "category": "Burger & Fried Fries",
      "priceRange": "\$10 - \$30",
      "rating": 4.5,
      "imagePath": "assets/Burger_King.jpg",
    },
    {
      "name": "KFC",
      "category": "Fried Chicken",
      "priceRange": "\$15 - \$35",
      "rating": 4.5,
      "imagePath": "assets/KFC.jpg",
    },
    {
      "name": "Pizza Hut",
      "category": "Pizza & Soda",
      "priceRange": "\$10 - \$50",
      "rating": 4.5,
      "imagePath": "assets/Pizza_Hut.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final filteredRestaurants = restaurants.where((restaurant) {
      final name = restaurant["name"].toString().toLowerCase();
      final category = restaurant["category"].toString().toLowerCase();
      return name.contains(searchQuery.toLowerCase()) ||
          category.contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                /// 🔹 HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deliver to",
                          style: TextStyle(color: Colors.grey),
                        ),
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

                /// 🔹 SEARCH BAR
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

                /// 🔹 PROMO BANNER (IMAGE VERSION)
                SizedBox(
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _promoBanner(
                        "50% OFF",
                        "On all Burgers",
                        "assets/Burger_Promo.jpg",
                      ),
                      _promoBanner(
                        "Buy 1 Get 1",
                        "For Pizza Lovers",
                        "assets/Pizza_Promo.jpg",
                      ),
                      _promoBanner(
                        "Free Drink",
                        "Min order \$25",
                        "assets/Drink_Promo.jpg",
                      ),
                      _promoBanner(
                        "Buy 5 Get Free Desert",
                        "Min order \$35",
                        "assets/Desert_Promo.jpg",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  "Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 16),

                SizedBox(
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _categoryItem("Burger", Icons.lunch_dining),
                      _categoryItem("Pizza", Icons.local_pizza),
                      _categoryItem("Drinks", Icons.local_drink),
                      _categoryItem("Dessert", Icons.icecream),
                      _categoryItem("Chicken", Icons.set_meal),
                      _categoryItem("Coffee", Icons.coffee),
                      _categoryItem("Noodles", Icons.ramen_dining),
                      _categoryItem("Steak", Icons.restaurant),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  "Popular Restaurants",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 16),

                /// 🔥 RESTAURANT LIST
                if (filteredRestaurants.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(Icons.search_off, size: 60, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
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
                  )
                else
                  ...filteredRestaurants.map((restaurant) {
                    return RestaurantCard(
                      name: restaurant["name"],
                      category: restaurant["category"],
                      priceRange: restaurant["priceRange"],
                      rating: restaurant["rating"],
                      imagePath: restaurant["imagePath"],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RestaurantDetailScreen(
                              name: restaurant["name"],
                              category: restaurant["category"],
                              rating: restaurant["rating"],
                              priceRange: restaurant["priceRange"],
                              imagePath: restaurant["imagePath"],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryItem(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MenuScreen(category: title)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, color: Colors.orange, size: 30),
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

Widget _promoBanner(String title, String subtitle, String imagePath) {
  return Container(
    width: 280,
    margin: const EdgeInsets.only(right: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
    ),
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black.withOpacity(0.45),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(subtitle, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    ),
  );
}
