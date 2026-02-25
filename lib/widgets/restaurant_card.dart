import 'package:flutter/material.dart';
import '../data/saved_data.dart';

class RestaurantCard extends StatefulWidget {
  final String name;
  final String category;
  final String priceRange;
  final double rating;
  final String imagePath;
  final VoidCallback onTap;

  const RestaurantCard({
    super.key,
    required this.name,
    required this.category,
    required this.priceRange,
    required this.rating,
    required this.imagePath,
    required this.onTap,
  });

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard>
    with SingleTickerProviderStateMixin {
  late bool isSaved;

  @override
  void initState() {
    super.initState();
    isSaved = saved.isSaved(widget.name);
    saved.addListener(_update);
  }

  void _update() {
    setState(() {
      isSaved = saved.isSaved(widget.name);
    });
  }

  @override
  void dispose() {
    saved.removeListener(_update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
          ],
        ),
        child: Stack(
          children: [
            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),

            /// GRADIENT
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                ),
              ),
            ),

            /// ❤️ FAVORITE BUTTON WITH ANIMATION
            Positioned(
              top: 12,
              right: 12,
              child: GestureDetector(
                onTap: () {
                  saved.toggleSaved(
                    name: widget.name,
                    category: widget.category,
                    priceRange: widget.priceRange,
                    rating: widget.rating,
                    imagePath: widget.imagePath,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: saved.isSaved(widget.name)
                        ? Colors.red.withOpacity(0.15)
                        : Colors.white.withOpacity(0.9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    saved.isSaved(widget.name)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: saved.isSaved(widget.name)
                        ? Colors.red
                        : Colors.grey,
                    size: 22,
                  ),
                ),
              ),
            ),

            /// TEXT
            Positioned(
              bottom: 15,
              left: 15,
              right: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.category,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
