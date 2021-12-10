import 'package:friendlyeats/Data/Models/products.dart';
import 'dart:convert';

List<Product> productList = [
  Product(id: 1, name: 'Fried Rice', price: 100, rating: 3),
  Product(id: 2, name: 'Fried Rice', price: 100, rating: 3),
  Product(id: 3, name: 'Fried Rice', price: 100, rating: 3),
  Product(id: 4, name: 'Fried Rice', price: 100, rating: 3),
  Product(id: 5, name: 'Fried Rice', price: 100, rating: 3),
  Product(id: 6, name: 'Fried Rice', price: 100, rating: 3),
];
var jsonList = productList.map((e) => e.toJson).toList;
json.encode(jsonList);
// final String encodedData = json.encode([
//   Product(id: 1, name: 'Fried Rice', price: 100, rating: 3).toJson(),
//   Product(id: 2, name: 'Fried Rice', price: 100, rating: 3),
//   Product(id: 3, name: 'Fried Rice', price: 100, rating: 3),
//   Product(id: 4, name: 'Fried Rice', price: 100, rating: 3),
//   Product(id: 5, name: 'Fried Rice', price: 100, rating: 3),
//   Product(id: 6, name: 'Fried Rice', price: 100, rating: 3),
// ]);

