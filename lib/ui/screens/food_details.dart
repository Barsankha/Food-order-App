import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/ui/screens/cart_screen.dart';

class FoodDetailPage extends StatelessWidget {
  final String description;
  final String title;
  final String imageurl;
  final double price;
  final double rating;
  const FoodDetailPage({
    super.key,
    required this.description,
    required this.title,
    required this.imageurl,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF507C7C), // teal background
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FoodImageHeader(imagePath: imageurl),
            SizedBox(height: 20),
            Expanded(
              child: FoodInfoCard(
                title: title,
                price: price,
                rating: rating,
                description: description,
                imagepath: imageurl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Top Section with Image + Back Button
class FoodImageHeader extends StatelessWidget {
  final String imagePath;

  const FoodImageHeader({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
          child: Image.asset(
            imagePath,
            height: 350,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}

/// Bottom Info Card
class FoodInfoCard extends StatelessWidget {
  final String title;
  final double price;
  final double rating;
  final String description;
  final String imagepath;

  const FoodInfoCard({
    super.key,
    required this.title,
    required this.price,
    required this.rating,
    required this.description,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FoodTitle(title: title, rating: rating),
          const SizedBox(height: 16),
          QuantityPriceRow(price: price),
          const SizedBox(height: 20),
          FoodDescription(description: description),
          const SizedBox(height: 20),
          MyButton(
            title: title,
            price: price,
            des: description,
            imageurl: imagepath,
          ),
        ],
      ),
    );
  }
}

/// Title + Rating Stars
class FoodTitle extends StatelessWidget {
  final String title;
  final double rating;

  const FoodTitle({super.key, required this.title, required this.rating});

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    bool hasHalfStar = rating - fullStars >= 0.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ...List.generate(
              fullStars,
              (index) => const Icon(Icons.star, color: Colors.black),
            ),
            if (hasHalfStar) const Icon(Icons.star_half, color: Colors.black),
          ],
        ),
      ],
    );
  }
}

/// Quantity Counter + Price
class QuantityPriceRow extends StatefulWidget {
  final double price;

  const QuantityPriceRow({super.key, required this.price});

  @override
  State<QuantityPriceRow> createState() => _QuantityPriceRowState();
}

class _QuantityPriceRowState extends State<QuantityPriceRow> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    String total = (widget.price * quantity).toStringAsFixed(2);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Counter
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF507C7C),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: Colors.white),
                onPressed: () {
                  setState(() {
                    if (quantity > 1) quantity--;
                  });
                },
              ),
              Text(
                "$quantity",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
              ),
            ],
          ),
        ),

        // Price
        Text(
          "\$$total",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

/// Scrollable Description
class FoodDescription extends StatelessWidget {
  final String description;

  const FoodDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "About this food",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String title;
  final String imageurl;
  final String des;
  final double price;
  const MyButton({
    super.key,
    required this.title,
    required this.imageurl,
    required this.des,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ElevatedButton.icon(
        iconAlignment: IconAlignment.start,
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder:
                  (_) => CartScreen(
                    title: title,
                    des: des,
                    imageurl: imageurl,
                    price: price,
                  ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: Colors.teal,
          iconColor: Colors.black,
          foregroundColor: Colors.white,
          overlayColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        icon: const Icon(Icons.shopping_cart, size: 25),
        label: const Text("Add to bag", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
