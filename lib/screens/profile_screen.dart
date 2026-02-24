import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import '../data/user_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // 🔥 Avatar
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),

            const SizedBox(height: 16),

            AnimatedBuilder(
              animation: user,
              builder: (context, _) {
                return Column(
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 20,
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

            TextButton(
              onPressed: () async {
                await Navigator.push(
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

            // 🔥 Menu Options
            _buildMenuItem(
              icon: Icons.location_on_outlined,
              title: "My Address",
              onTap: () {},
            ),

            _buildMenuItem(
              icon: Icons.payment_outlined,
              title: "Payment Methods",
              onTap: () {},
            ),

            _buildMenuItem(
              icon: Icons.history,
              title: "Order History",
              onTap: () {
                Navigator.pop(context);
              },
            ),

            _buildMenuItem(
              icon: Icons.settings_outlined,
              title: "Settings",
              onTap: () {},
            ),

            const SizedBox(height: 20),

            // 🔥 Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {},
                child: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
