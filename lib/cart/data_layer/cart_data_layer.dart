import 'dart:convert';

import 'package:friendlyeats/product/data_layer/models/product_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider{
  Future<void> addToCart(Product product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final cartList = map.map((e) => Product.fromJson(e)).toList();
    //  cartList.removeWhere((ae)=> ae.id == product.id);
      bool incrementProduct = cartList.any((element) => element.id == product.id);
      print(incrementProduct);
      if(incrementProduct) {
        incrementCartProduct(product);
      } else {
        cartList.add(product);
      }
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

  Future<void> incrementCartProduct(Product product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final cartList = map.map((e) => Product.fromJson(e)).toList();
      // int index = cartList.indexOf(product);
      final index = cartList.indexWhere((element) => element.id == product.id);
      cartList[index].qty++;
      final carJson = cartList.map((e) => e.toJson()).toList();
      var encodedList = json.encode(carJson);
      await prefs.setString('cartList', encodedList);
    }
  }

  Future<void> decrementCartProduct(Product product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('cartList');
    if (userPref != null) {
      final map = json.decode(userPref) as List;
      final cartList = map.map((e) => Product.fromJson(e)).toList();
      final index = cartList.indexWhere((element) => element.id == product.id);
      cartList[index].qty--;
      final carJson = cartList.map((e) => e.toJson()).toList();
      var encodedList = json.encode(carJson);
      await prefs.setString('cartList', encodedList);
    }
  }
}