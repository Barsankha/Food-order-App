import 'package:flutter/material.dart';

class FoodMenuCard extends StatelessWidget {
  final String label;
  final String imagePath;
  final Color backgroundColor;

  const FoodMenuCard({
    super.key,
    required this.label,
    required this.imagePath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Food Image
          Positioned(
            bottom: 0,
            child: Image.asset(
              imagePath,
              height: 140,
              width: 110,
              fit: BoxFit.contain,
            ),
          ),
          // Label
          Positioned(
            top: 12,
            left: 12,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
