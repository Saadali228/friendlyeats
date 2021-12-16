import 'package:flutter/material.dart';

class ReviewInitial extends StatelessWidget {
  const ReviewInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('No reviews', style: TextStyle(fontSize: 64)),
      ],
    );
  }
}
