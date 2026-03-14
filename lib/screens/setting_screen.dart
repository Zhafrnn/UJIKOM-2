import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_mobile_app/screens/order_screen.dart';
import '../data/user_data.dart';
import 'edit_profile_screen.dart';
import 'address_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {

    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      user.updatePhoto(image.path);
    }
  }

  Widget _buildAvatar() {
    return Stack(
      children: [

        GestureDetector(
          onTap: _pickImage,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.orange,
            backgroundImage: user.photoPath != null
                ? FileImage(File(user.photoPath!))
                : null,
            child: user.photoPath == null
                ? const Icon(Icons.person, size: 50, color: Colors.white)
                : null,
          ),
        ),

        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6),
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 30),

            AnimatedBuilder(
              animation: user,
              builder: (context, _) {

                return Column(
                  children: [

                    _buildAvatar(),

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

            _buildMenuItem(context, Icons.person_outline, "Edit Profile", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EditProfileScreen()),
              );
            }),

            _buildMenuItem(
              context,
              Icons.location_on_outlined,
              "My Address",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddressScreen()),
                );
              },
            ),

            _buildMenuItem(
              context,
              Icons.credit_card,
              "Payment Methods",
              () {},
            ),

            _buildMenuItem(context, Icons.history, "Order History", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const OrderScreen()),
              );
            }),

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
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Card(
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 20,
            ),
            child: Row(
              children: [

                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: Colors.orange),
                ),

                const SizedBox(width: 18),

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