import 'package:flutter/material.dart';
import 'package:guipro_project/main.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double total = cart.fold(
      0,
      (sum, item) => sum + item['product'][2] * item['quantity'],
    );

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                var item = cart[index];
                var product = item['product'];
                return ListTile(
                  title: Text(product[0]),
                  subtitle: Text('\$${product[2]} x ${item['quantity']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            cart.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/checkout'),
              child: Text('Checkout (\$${total.toStringAsFixed(2)})'),
            ),
          ),
        ],
      ),
    );
  }
}