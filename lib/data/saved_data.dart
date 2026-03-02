import '../models/saved_model.dart';

class Restaurant {
  final String name;
  final String category;
  final String priceRange;
  final double rating;
  final String imagePath;
  final String description; // wajib ada

  Restaurant({
    required this.name,
    required this.category,
    required this.priceRange,
    required this.rating,
    required this.imagePath,
    required this.description,
  });
}

SavedModel saved = SavedModel();
