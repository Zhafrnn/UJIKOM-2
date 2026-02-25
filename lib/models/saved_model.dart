import 'package:flutter/material.dart';

class SavedItem {
  final String name;
  final String category;
  final String priceRange;
  final double rating;
  final String imagePath;

  SavedItem({
    required this.name,
    required this.category,
    required this.priceRange,
    required this.rating,
    required this.imagePath,
  });
}

class SavedModel extends ChangeNotifier {
  final List<SavedItem> _items = [];

  List<SavedItem> get items => _items;

  void toggleSaved({
    required String name,
    required String category,
    required String priceRange,
    required double rating,
    required String imagePath,
  }) {
    final index = _items.indexWhere((item) => item.name == name);

    if (index >= 0) {
      _items.removeAt(index);
    } else {
      _items.add(
        SavedItem(
          name: name,
          category: category,
          priceRange: priceRange,
          rating: rating,
          imagePath: imagePath,
        ),
      );
    }

    notifyListeners();
  }

  bool isSaved(String name) {
    return _items.any((item) => item.name == name);
  }
}
