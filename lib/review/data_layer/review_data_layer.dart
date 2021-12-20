import 'dart:convert';

import 'package:friendlyeats/review/repository/models/review_repository_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/review_data_model.dart';

class ReviewProvider {
  Future<void> addReview(ReviewDataModel review) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('reviewList');

    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final reviewList = map
          .map(
            (e) => ReviewDataModel.fromJson(e),
          )
          .toList();
      reviewList.add(review);
      final reviewJson = reviewList
          .map(
            (e) => e.toJson(),
          )
          .toList();
      var encodedList = json.encode(reviewJson);
      await prefs.setString('reviewList', encodedList);
    } else {
      List<ReviewDataModel> reviewList = [];
      reviewList.add(review);
      final reviewJson = reviewList
          .map(
            (e) => e.toJson(),
          )
          .toList();
      var encodedList = json.encode(reviewJson);

      await prefs.setString('reviewList', encodedList);
    }
  }

  Future<List<ReviewDataModel>> getReviews() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('reviewList');
    if (userPref == null) return [];
    final map = json.decode(userPref) as List;
    final list = map.map((e) => ReviewDataModel.fromJson(e)).toList();
    return list;
  }
}
