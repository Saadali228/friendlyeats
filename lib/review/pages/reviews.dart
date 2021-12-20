import 'package:flutter/material.dart';
import 'package:friendlyeats/review/pages/display_reviews.dart';
import 'package:friendlyeats/review/repository/models/review_repository_model.dart';


class ReviewLoaded extends StatelessWidget {
  const ReviewLoaded({Key? key, required this.reviewList}) : super(key: key);
  final List<ReviewRepoModel> reviewList;

  @override
  Widget build(BuildContext context) {
    if (reviewList.isEmpty) {
      return const SliverToBoxAdapter(
          child: Text('No Reviews!', style: TextStyle(fontSize: 64)));
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return RestaurantReview(review: reviewList[index]);
        },
        childCount: reviewList.length,
      ),
      // children: reviewList.map((e) => RestaurantReview(review: e)).toList(),
    );
  }
}
