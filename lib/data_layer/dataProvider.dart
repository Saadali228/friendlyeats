import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:friendlyeats/json_data/product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/products.dart';
import 'models/reviews.dart';

class DataProvider {
  Future<void> intializeProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('productList', json.encode(mapData));
  }

  Future<List<Product>> getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('productList');
    if (userPref == null) return [];
    final map = json.decode(userPref) as List;
    final list = map.map((e) => Product.fromJson(e)).toList();
    return list;
  }

  Future<void> addReview(Review review) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('reviewList');

    if (userPref != null) {
      print('in not null');
      final map = json.decode(userPref) as List;
      final reviewList = map.map((e) => Review.fromJson(e)).toList();
      reviewList.add(review);
      final reviewJson = reviewList.map((e) => e.toJson()).toList();
      var encodedList = json.encode(reviewJson);
      await prefs.setString('reviewList', encodedList);
    } else {
      List<Review> reviewList = [];
      reviewList.add(review);
      final reviewJson = reviewList.map((e) => e.toJson()).toList();
      var encodedList = json.encode(reviewJson);

      await prefs.setString('reviewList', encodedList);
    }
  }

  Future<List<Review>> getReviews() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('reviewList');
    if (userPref == null) return [];
    final map = json.decode(userPref) as List;
    final list = map.map((e) => Review.fromJson(e)).toList();
    return list;
  }

  Future<void> addToCart(Product product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final cartList = map.map((e) => Product.fromJson(e)).toList();
      cartList.add(product);
      final carJson = cartList.map((e) => e.toJson()).toList();
      var encodedList = json.encode(carJson);
      await prefs.setString('cartList', encodedList);
    } else {
      List<Product> cartList = [];
      cartList.add(product);
      final carJson = cartList.map((e) => e.toJson()).toList();
      var encodedList = json.encode(carJson);
      await prefs.setString('cartList', encodedList);
    }
  }

  Future<List<Product>> getCartProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    if (userPref == null) return [];
    final map = json.decode(userPref) as List;
    final list = map.map((e) => Product.fromJson(e)).toList();
    return list;
  }

  Future<void> deleteProductFromCart(Product product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final cartList = map.map((e) => Product.fromJson(e)).toList();
      cartList.removeWhere((ae) => ae.id == product.id);
      final carJson = cartList.map((e) => e.toJson()).toList();
      var encodedList = json.encode(carJson);
      await prefs.setString('cartList', encodedList);
    }
    // else {
    //   List<Product> cartList = [];
    //   cartList.remove(product);
    //   final carJson = cartList.map((e) => e.toJson()).toList();
    //   var encodedList = json.encode(carJson);
    //   await prefs.setString('cartList', encodedList);
    // }
  }

  Future<void> updateCartProduct(Product product, bool isAdd) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final cartList = map.map((e) => Product.fromJson(e)).toList();
      int index = cartList.indexOf(product);
      // final id = cartList.indexWhere((element) => element.id == pid);
      if (isAdd) cartList[index].qty++;
      if (!isAdd) cartList[index].qty--;
      final carJson = cartList.map((e) => e.toJson());
      var encodedList = json.encode(carJson);
      await prefs.setString('cartList', encodedList);
    }
  }
}
