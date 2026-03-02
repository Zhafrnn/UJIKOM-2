import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Background semua screen

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // AppBar putih
          elevation: 0, // Hilangkan bayangan
          centerTitle: false,
          iconTheme: IconThemeData(color: Colors.black), // warna icon back
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: MainScreen(),
    );
  }
}
