import 'package:flutter/material.dart';

class OrderStatusScreen extends StatelessWidget {
  final String orderId;
  final double total;
  const OrderStatusScreen({
    super.key,
    required this.orderId,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Confirmed')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(Icons.check_circle, size: 96, color: Colors.green),
            SizedBox(height: 12),
            Text(
              'Order #$orderId',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Total: \$${total.toStringAsFixed(2)}'),
            SizedBox(height: 20),
            Text(
              'Your order is being prepared. You can track status here — (mock).',
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed:
                  () => Navigator.popUntil(context, (route) => route.isFirst),
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
