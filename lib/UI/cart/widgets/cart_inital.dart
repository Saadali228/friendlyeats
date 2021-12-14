import 'package:flutter/material.dart';

class CartInitial extends StatelessWidget {
  const CartInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Cart is Empty!', style: TextStyle(fontSize: 64)),
      ],
    );
  }
}