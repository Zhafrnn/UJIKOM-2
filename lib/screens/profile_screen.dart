import 'dart:io';
import 'package:flutter/material.dart';
import 'package:restaurant_mobile_app/screens/order_screen.dart';
import '../data/user_data.dart';
import 'edit_profile_screen.dart';
import 'setting_screen.dart';
import 'address_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // 🔥 USER INFO (Reactive)
            AnimatedBuilder(
              animation: user,
              builder: (context, _) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.orange,
                      backgroundImage: user.photoPath != null
                          ? FileImage(File(user.photoPath!))
                          : null,
                      child: user.photoPath == null
                          ? const Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      user.email,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 12),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                );
              },
              child: const Text(
                "Edit Profile",
                style: TextStyle(color: Colors.orange),
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 MENU LIST
            _buildMenuItem(
              context,
              Icons.location_on_outlined,
              "My Address",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddressScreen()),
                );
              },
            ),
            _buildMenuItem(context, Icons.credit_card, "Payment Methods"),
            _buildMenuItem(
              context,
              Icons.history,
              "Order History",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OrderScreen()),
                );
              },
            ),
            _buildMenuItem(
              context,
              Icons.settings,
              "Settings",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingScreen()),
                );
              },
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
    String title, {
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(icon, color: Colors.orange),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
