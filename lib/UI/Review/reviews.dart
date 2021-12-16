import 'package:flutter/material.dart';
import 'package:friendlyeats/UI/Review/display_reviews.dart';
import 'package:friendlyeats/UI/product/widgets/product_loaded/product_grid.dart';
import 'package:friendlyeats/bloc/Cart/bloc/cart_bloc.dart';
import 'package:friendlyeats/data_layer/models/products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlyeats/data_layer/models/reviews.dart';

class ReviewLoaded extends StatelessWidget {
  const ReviewLoaded({Key? key, required this.reviewList}) : super(key: key);
  final List<Review> reviewList;

  @override
  Widget build(BuildContext context) {
    print(reviewList.length);
    if (reviewList.isEmpty) {
      return const Text('No Reviews!', style: TextStyle(fontSize: 64));
    }
    return Column(
      children: reviewList.map((e) => RestaurantReview(review: e)).toList(),
    );
  }
}
