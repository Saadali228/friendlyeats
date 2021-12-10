import 'dart:convert';
import 'package:friendlyeats/Data/Models/data.json';
import 'package:friendlyeats/Data/Models/products.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataProvider {
  Future<void> addProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final list = productList;
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
}
