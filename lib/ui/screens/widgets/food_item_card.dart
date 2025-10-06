import 'package:flutter/material.dart';
import 'package:food_app/ui/screens/food_details.dart';

class FoodItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double price;
  final double rating;
  final VoidCallback onAddToBag;

  const FoodItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.onAddToBag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => FoodDetailPage(
                  description: description,
                  title: title,
                  imageurl: imageUrl,
                  price: price,
                  rating: rating,
                ),
          ),
        );
      },
      child: Container(
        width: 250,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Card background
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF3E7A89), // teal-ish background
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.fromLTRB(
                16,
                90,
                16,
                16,
              ), // leave space for image
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // rating stars
                  SizedBox(height: 65),
                  Row(
                    children: List.generate(
                      rating.toInt(),
                      (index) =>
                          const Icon(Icons.star, size: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Description
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 18),
                  // Price
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Add to bag button
                  ElevatedButton.icon(
                    onPressed: onAddToBag,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    icon: const Icon(Icons.shopping_bag_outlined),
                    label: const Text("Add to bag"),
                  ),
                ],
              ),
            ),

            // Floating food image
            Positioned(
              top: -26,
              left: 40,
              right: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100), // if circular needed
                child: Image.asset(imageUrl, height: 180, fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
