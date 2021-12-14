import 'package:flutter/material.dart';

class ProductInitial extends StatelessWidget {
  const ProductInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Products are Empty!', style: TextStyle(fontSize: 64)),
      ],
    );
  }
}