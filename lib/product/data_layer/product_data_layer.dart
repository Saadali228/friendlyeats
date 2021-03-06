import 'dart:convert';

import 'package:friendlyeats/data/product_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/product_data_model.dart';

class ProductProvider {
  Future<void> initializeProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('productList', json.encode(mapData));
  }

  Future<List<ProductDataModel>> getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('productList');
    if (userPref == null) return [];
    final map = json.decode(userPref) as List;
    final list = map.map((e) => ProductDataModel.fromJson(e)).toList();
    return list;
  }
}
