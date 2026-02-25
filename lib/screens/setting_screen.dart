import 'package:flutter/material.dart';
import 'package:restaurant_mobile_app/screens/order_screen.dart';
import '../data/user_data.dart';
import 'edit_profile_screen.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // 🔥 USER INFO (REACTIVE)
            AnimatedBuilder(
              animation: user,
              builder: (context, _) {
                return Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.email,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 30),

            _buildMenuItem(
              context,
              Icons.person_outline,
              "Edit Profile",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EditProfileScreen(),
                  ),
                );
              },
            ),

            _buildMenuItem(
              context,
              Icons.location_on_outlined,
              "My Address",
              () {},
            ),

            _buildMenuItem(
              context,
              Icons.credit_card,
              "Payment Methods",
              () {},
            ),

            _buildMenuItem(
              context,
              Icons.history,
              "Order History",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const OrderScreen(),
                  ),
                );
              },
            ),

            _buildMenuItem(
              context,
              Icons.logout,
              "Logout",
              () {},
              isLogout: true,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool isLogout = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(icon, color: isLogout ? Colors.red : Colors.orange),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: isLogout ? Colors.red : Colors.black,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}