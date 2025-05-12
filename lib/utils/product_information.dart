import 'package:flutter/material.dart';

class ProductInformationDialog extends StatelessWidget{
  final List<dynamic> product;

  const ProductInformationDialog({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(product[0], textAlign: TextAlign.center,),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(product[1], width: 200, height: 150),
          Text(product[0]),
          SizedBox(height: 10),
          Text('\$${product[2]}'),
          SizedBox(height: 10),
          Text('Rating: ${product[3]}'),
          SizedBox(height: 10),
          Text('Quantity: ${product[4]}'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Close"),
        ),
      ],
    );
  }
}