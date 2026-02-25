import 'package:flutter/material.dart';
import '../data/cart_data.dart';
import 'package:restaurant_mobile_app/screens/cart_screen.dart';
import 'package:restaurant_mobile_app/screens/home_screen.dart';
import 'package:restaurant_mobile_app/screens/saved_screen.dart';
import 'package:restaurant_mobile_app/screens/order_screen.dart';
// import 'package:restaurant_mobile_app/screens/profile_screen.dart';
import 'setting_screen.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({super.key, this.initialIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  // int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    SavedScreen(),
    CartScreen(),
    OrderScreen(),
    // ProfileScreen(),
    SettingScreen(),
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

              // Setting
              IconButton(
                icon: Icon(
                  Icons.settings_outlined,
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
