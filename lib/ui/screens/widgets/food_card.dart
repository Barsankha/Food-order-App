import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String title;
  final String imageurl;
  final String des;
  final double price;

  const FoodCard({
    super.key,
    required this.title,
    required this.imageurl,
    required this.des,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 5,
      child: ListTile(
        leading: Image.network(imageurl, width: 60, fit: BoxFit.cover),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(des),
        trailing: Text(
          "\$${price.toStringAsFixed(2)}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
