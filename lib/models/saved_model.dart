import 'package:flutter/material.dart';

class SavedItem {
  final String name;
  final String category;

  SavedItem({
    required this.name,
    required this.category,
  });
}

class SavedModel extends ChangeNotifier {
  final List<SavedItem> _items = [];

  List<SavedItem> get items => _items;

  void toggleSaved(String name, String category) {
    final index =
        _items.indexWhere((item) => item.name == name);

    if (index >= 0) {
      _items.removeAt(index);
    } else {
      _items.add(SavedItem(
        name: name,
        category: category,
      ));
    }

    notifyListeners();
  }

  bool isSaved(String name) {
    return _items.any((item) => item.name == name);
  }
}
