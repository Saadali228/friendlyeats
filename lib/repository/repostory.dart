import 'package:friendlyeats/data_layer/models/products.dart';
import 'package:friendlyeats/data_layer/dataProvider.dart';
import 'package:friendlyeats/data_layer/models/reviews.dart';

class Repository {
  Future<List<Product>> getProducts() async {
    DataProvider? _dataProvider;
    var _productsList = await _dataProvider!.getProducts();
    return _productsList;
  }

  Future<void> addProducts() async {
    DataProvider? _dataProvider;
    await _dataProvider!.addProducts();
  }

  Future<List<Review>> getReviews() async {
    DataProvider? _dataProvider;
    var _reviewsList = await _dataProvider!.getReviews();
    return _reviewsList;
  }

  Future<void> addReview(String message, int rating) async {
    DataProvider? _dataProvider;
    final _reviewList = _dataProvider!.getReviews() as List<Review>;
    int id = _reviewList.length + 1;
    await _dataProvider.addReview(id, message, rating);
  }
}
