import 'package:flutter/material.dart';
import 'package:food_app/ui/screens/cart_screen.dart';
import 'package:food_app/ui/screens/widgets/food_item_card.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({super.key});

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  final List<Map<String, dynamic>> mockFoodData = [
    {
      "imageUrl": "assets/food/1.png",
      "title": "Garlic Aioli Chicken Wings +",
      "description":
          "Indulge in a tantalizing fusion of flavors with the Garlic Aioli Chicken Wings, served with roasted veggies.",
      "price": 299.9,
      "rating": 4.0,
    },
    {
      "imageUrl": "assets/food/2.png",
      "title": "Classic Cheeseburger",
      "description":
          "Juicy grilled beef patty topped with cheddar cheese, lettuce, tomato, and our secret sauce.",
      "price": 199.9,
      "rating": 5.0,
    },
    {
      "imageUrl": "assets/food/3.png",
      "title": "Margherita Pizza",
      "description":
          "Wood-fired pizza topped with fresh mozzarella, basil, and a drizzle of olive oil.",
      "price": 399.9,
      "rating": 5.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Most',
                style: TextStyle(
                  color: Color(0xFF4F4D4E),
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Popular Food',
                style: TextStyle(
                  color: Color(0xFF4F4D4E),
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.51,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: mockFoodData.length,
            itemBuilder: (context, index) {
              final food = mockFoodData[index];
              return FoodItemCard(
                imageUrl: food['imageUrl'] ?? '',
                title: food['title'] ?? '',
                description: food['description'] ?? '',
                price: food['price'],
                rating: food['rating'] ?? '',
                onAddToBag: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => CartScreen(
                            title: food['title'],
                            des: food['description'],
                            imageurl: food['imageUrl'],
                            price: food['price'],
                          ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
