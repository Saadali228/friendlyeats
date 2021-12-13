import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:friendlyeats/data_layer/models/cart.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'models/products.dart';
import 'models/reviews.dart';

class DataProvider {
  Future<void> intializeProducts() async {
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
    String? userPref = prefs.getString('reviewList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final reviewList = map.map((e) => Review.fromJson(e)).toList();
      reviewList.add(Review(
        id: id,
        message: message,
        rating: rating,
      ));
      final reviewJson = reviewList.map((e) => e.toJson());
      var encodedList = json.encode(reviewJson);
      await prefs.setString('reviewList', encodedList);
    } else {
      List<Review> reviewList = [];
      reviewList.add(Review(
        id: id,
        message: message,
        rating: rating,
      ));
      final reviewJson = reviewList.map((e) => e.toJson());
      var encodedList = json.encode(reviewJson);
      await prefs.setString('reviewList', encodedList);
    }
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

  Future<void> addToCart(
      int id, String name, double price, int qty, int rating) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final cartList = map.map((e) => Product.fromJson(e)).toList();
      cartList.add(
          Product(id: id, name: name, price: price, qty: qty, rating: rating));
      final carJson = cartList.map((e) => e.toJson());
      var encodedList = json.encode(carJson);
      await prefs.setString('cartList', encodedList);
    } else {
      List<Product> cartList = [];
      cartList.add(
          Product(id: id, name: name, price: price, qty: qty, rating: rating));
      final carJson = cartList.map((e) => e.toJson());
      var encodedList = json.encode(carJson);
      await prefs.setString('cartList', encodedList);
    }
  }

  Future<List<Product>> getCartProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    final map = json.decode(userPref!) as List;
    final list = map.map((e) => Product.fromJson(e)).toList();
    return list;
  }

  Future<void> deleteProductFromCart(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final cartList = map.map((e) => Product.fromJson(e)).toList();
      cartList.removeWhere((element) => element.id == id);
      final carJson = cartList.map((e) => e.toJson());
      var encodedList = json.encode(carJson);
      await prefs.setString('cartList', encodedList);
    }
  }

  Future<void> updateCartProduct(int pid, int qty, bool isAdd) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final cartList = map.map((e) => Product.fromJson(e)).toList();
      final id = cartList.indexWhere((element) => element.id == pid);
      if (isAdd) cartList[id].qty++;
      if (!isAdd) cartList[id].qty--;
      final carJson = cartList.map((e) => e.toJson());
      var encodedList = json.encode(carJson);
      await prefs.setString('cartList', encodedList);
    }
  }
}
