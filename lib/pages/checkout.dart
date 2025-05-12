import 'package:flutter/material.dart';
import 'package:guipro_project/main.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    for (var item in cart) {
      var product = item['product'];
      product[4] -= item['quantity'];
      if (product[4] < 0) product[4] = 0;
    }
    
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thanks for the purchase!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cart.clear();
                Navigator.popUntil(context, ModalRoute.withName('/home'));
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}