import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/ui/screens/widgets/food_card.dart';
import '../../blocs/cart/cart_cubit.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartCubit>();
//     return Scaffold(
//       appBar: AppBar(title: Text('Your Cart')),
//       body: Padding(
//         padding: EdgeInsets.all(12),
//         child: Column(
//           children: [
//             Expanded(
//               child: BlocBuilder<CartCubit, dynamic>(
//                 builder: (context, state) {
//                   final items = state.items as List;
//                   if (items.isEmpty) {
//                     return Center(child: Text('Cart is empty'));
//                   }
//                   return ListView.separated(
//                     itemCount: items.length,
//                     separatorBuilder: (_, __) => Divider(),
//                     itemBuilder: (context, i) {
//                       final it = items[i];
//                       return ListTile(
//                         title: Text(it.item.name),
//                         subtitle: Text('Qty: ${it.qty}'),
//                         trailing: Text('\$' + it.total.toStringAsFixed(2)),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//             Divider(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Total:',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   '\$${cart.state.total.toStringAsFixed(2)}',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ],
//             ),
//             SizedBox(height: 12),
//             // ElevatedButton(
//             //   onPressed:
//             //       cart.state.items.isEmpty
//             //           ? null
//             //           : () {
//             //             Navigator.push(
//             //               context,
//             //               MaterialPageRoute(builder: (_) => CheckoutScreen()),
//             //             );
//             //           },
//             //   child: SizedBox(
//             //     width: double.infinity,
//             //     child: Center(child: Text('Proceed to Checkout')),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CartScreen extends StatelessWidget {
  final String title;
  final String des;
  final String imageurl;
  final double price;

  const CartScreen({
    super.key,
    required this.title,
    required this.des,
    required this.imageurl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return FoodCard(
                  title: title,
                  imageurl: imageurl,
                  des: des,
                  price: price,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
