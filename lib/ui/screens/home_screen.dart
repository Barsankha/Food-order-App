import 'package:flutter/material.dart';
import 'package:food_app/ui/screens/food_menu_screen.dart';
import 'package:food_app/ui/screens/most_popular.dart';
import 'package:food_app/ui/screens/restaurant_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('F O O D A P P'),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            // actions: [
            //   IconButton(
            //     icon: const Icon(Icons.shopping_cart),
            //     onPressed:
            //         () => Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (_) => CartScreen()),
            //         ),
            //   ),
            // ],
          ),
          SliverToBoxAdapter(child: RestaurantCategories()),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(child: FoodMenuScreen()),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(child: MostPopular()),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
