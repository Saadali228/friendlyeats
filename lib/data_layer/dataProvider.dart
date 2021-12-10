import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'models/products.dart';
import 'models/reviews.dart';

class DataProvider {
  Future<void> addProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String response =
        await rootBundle.loadString('lib/json_data/product.json');
    final list = await json.decode(response);
    var jsonList = list.map((e) => e.toJson()).toList();
    var encodedList = json.encode(jsonList);
    await prefs.setString('productList', encodedList);
  }

  Future<List<Product>> getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('productList');
    final map = json.decode(userPref!) as List;
    final list = map.map((e) => Product.fromJson(e)).toList();
    return list;
  }

  Future<void> addReview(int id, String message, int rating) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final map = {
      "id": id,
      "message": message,
      "rating": rating,
    };
    var encodedList = json.encode(map);
    await prefs.setString('reviewList', encodedList);
  }

  Future<List<Review>> getReviews() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('reviewList');
    final map = json.decode(userPref!) as List;
    final list = map.map((e) => Review.fromJson(e)).toList();
    return list;
  }
}
