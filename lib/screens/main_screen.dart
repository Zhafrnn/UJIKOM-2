import 'package:flutter/material.dart';
import '../data/cart_data.dart';
import 'package:restaurant_mobile_app/screens/cart_screen.dart';
import 'package:restaurant_mobile_app/screens/home_screen.dart';
import 'package:restaurant_mobile_app/screens/saved_screen.dart';
import 'package:restaurant_mobile_app/screens/order_screen.dart';
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

  final List<Widget> _pages = const [
    HomeScreen(),
    SavedScreen(),
    CartScreen(),
    OrderScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    bool isCart = false,
  }) {
    final bool isActive = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: cart,
            builder: (context, _) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isActive ? Colors.orange : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: isActive ? Colors.white : Colors.grey,
                    ),
                  ),

                  // 🔥 Badge Cart
                  if (isCart && cart.totalItems > 0)
                    Positioned(
                      right: -6,
                      top: -6,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        child: Text(
                          cart.totalItems.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Colors.orange : Colors.grey,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(icon: Icons.home_outlined, label: "Home", index: 0),
            _buildNavItem(
              icon: Icons.favorite_border,
              label: "Favorite",
              index: 1,
            ),
            _buildNavItem(
              icon: Icons.shopping_bag_outlined,
              label: "Cart",
              index: 2,
              isCart: true,
            ),
            _buildNavItem(
              icon: Icons.receipt_long_outlined,
              label: "Orders",
              index: 3,
            ),
            _buildNavItem(
              icon: Icons.settings_outlined,
              label: "Settings",
              index: 4,
            ),
          ],
        ),
      ),
    );
  }
}
