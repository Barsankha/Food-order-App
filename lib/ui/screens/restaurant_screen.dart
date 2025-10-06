import 'package:flutter/material.dart';
import 'package:food_app/ui/screens/widgets/category_card.dart';

class RestaurantCategories extends StatefulWidget {
  const RestaurantCategories({super.key});

  @override
  State<RestaurantCategories> createState() => _RestaurantCategoriesState();
}

class _RestaurantCategoriesState extends State<RestaurantCategories> {
  int selectedIndex = 0;

  final List<Map<String, String>> categories =
      [
        {"icon": "assets/icons/pizza.svg", "label": "Pizza"},
        {"icon": "assets/icons/hamburger.svg", "label": "Burger"},
        {"icon": "assets/icons/ice-cream.svg", "label": "Ice Cream"},
        {"icon": "assets/icons/meat.svg", "label": "meat"},
      ].where((cat) => cat["icon"] != null && cat["label"] != null).toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Restaurants",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Color(0xFF4F4D4E),
            ),
          ),
          const SizedBox(height: 16),

          // Horizontal list of categories
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryCard(
                  iconPath: categories[index]["icon"]!,
                  label: categories[index]["label"]!,
                  isSelected: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
