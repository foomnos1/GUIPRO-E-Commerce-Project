import 'package:flutter/material.dart';
import 'pages/cart.dart';
import 'pages/checkout.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

List<Map<String, dynamic>> cart = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomePage(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Retro Game Shop', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}