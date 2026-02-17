import 'package:flutter/material.dart';
import 'package:restaurant_mobile_app/screens/cart_screen.dart';
import 'package:restaurant_mobile_app/screens/home_screen.dart';
import '../data/cart_data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    Center(child: Text("Saved Screen")),
    CartScreen(),
    Center(child: Text("Orders Screen")),
    Center(child: Text("Profile Screen")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      floatingActionButton: AnimatedBuilder(
        animation: cart,
        builder: (context, _) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.orange,
                onPressed: () => _onItemTapped(2),
                child: const Icon(Icons.shopping_bag),
              ),

              if (cart.totalItems > 0)
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cart.totalItems.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          );
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home
              IconButton(
                icon: Icon(
                  Icons.home_outlined,
                  color: _selectedIndex == 0 ? Colors.orange : Colors.grey,
                ),
                onPressed: () => _onItemTapped(0),
              ),

              // Saved
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: _selectedIndex == 1 ? Colors.orange : Colors.grey,
                ),
                onPressed: () => _onItemTapped(1),
              ),

              const SizedBox(width: 40), // space for FAB
              // Orders
              IconButton(
                icon: Icon(
                  Icons.receipt_long_outlined,
                  color: _selectedIndex == 3 ? Colors.orange : Colors.grey,
                ),
                onPressed: () => _onItemTapped(3),
              ),

              // Profile
              IconButton(
                icon: Icon(
                  Icons.person_outline,
                  color: _selectedIndex == 4 ? Colors.orange : Colors.grey,
                ),
                onPressed: () => _onItemTapped(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
