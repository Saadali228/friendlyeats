import 'package:flutter/material.dart';
import 'package:friendlyeats/review/repository/models/review_repository_model.dart';

class RestaurantReview extends StatelessWidget {
  const RestaurantReview({
    Key? key,
    required this.review,
  }) : super(key: key);

  final ReviewRepoModel review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: .5,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Row(
              children: const <Widget>[
                Text(
                  "Anonymous",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: Text(
                    review.message,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
