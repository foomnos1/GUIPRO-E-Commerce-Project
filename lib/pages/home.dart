import 'package:flutter/material.dart';
import '../main.dart';
import '../utils/product_information.dart';
import '../utils/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  var products = Products().products;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.pushNamed(context, '/cart');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products[index];
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => ProductInformationDialog(product: product),
              );
            },
            child: ListTile(
              leading: Image.asset(product[1], width: 100, height: 50),
              title: Text(product[0]),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${product[2]}'),
                  Text('Rating: ${product[3]}'),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    var existing = cart.indexWhere(
                      (item) => item['product'][0] == product[0],
                    );
                    if (existing >= 0) {
                      cart[existing]['quantity']++;
                    } else {
                      cart.add({'product': product, 'quantity': 1});
                    }
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product[0]} added to cart')),
                  );
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}