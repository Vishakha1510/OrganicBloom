import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFFA5CC65),
          foregroundColor: Colors.white,
          title: Text(
            "Your Cart",
            style: TextStyle(fontSize: 25),
          )),
    );
  }
}
