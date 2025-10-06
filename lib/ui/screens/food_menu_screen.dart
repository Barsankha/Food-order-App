import 'package:flutter/material.dart';
import 'package:food_app/ui/screens/widgets/food_menu.dart';

class FoodMenuScreen extends StatelessWidget {
  const FoodMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> foodItems = [
      {
        "label": "Burger",
        "image": "assets/img/image (1).png",
        "color": Colors.blue.shade300,
      },
      {
        "label": "Pizza",
        "image": "assets/img/image (2).png",
        "color": Colors.purple.shade300,
      },
      {
        "label": "BBQ",
        "image": "assets/img/image (3).png",
        "color": Colors.blue.shade300,
      },
      {
        "label": "Fruit",
        "image": "assets/img/image (4).png",
        "color": Colors.purple.shade300,
      },
      {
        "label": "Sushi",
        "image": "assets/img/image (5).png",
        "color": Colors.blue.shade300,
      },
      {
        "label": "Noodle",
        "image": "assets/img/image (6).png",
        "color": Colors.purple.shade300,
      },
    ];

    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Food Menu",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4F4D4E),
                ),
              ),
              // Text(
              //   "View All",
              //   style: TextStyle(
              //     fontSize: 14,
              //     color: Colors.blue,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
            ],
          ),
          //const SizedBox(height: 2),
          // Grid
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: foodItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 cards in each row
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              //final item = foodItems[index];
              return FoodMenuCard(
                label: foodItems[index]["label"] ?? '',
                imagePath: foodItems[index]["image"] ?? '',
                backgroundColor: foodItems[index]["color"] ?? Colors.grey,
              );
            },
          ),
        ],
      ),
    );
  }
}
