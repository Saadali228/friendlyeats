import 'package:flutter/material.dart';

class ReviewError extends StatelessWidget {
  const ReviewError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Something went wrong!', style: TextStyle(fontSize: 64)),
      ],
    );
  }
}
