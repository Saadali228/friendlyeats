import 'package:friendlyeats/data_layer/models/products.dart';
import 'package:friendlyeats/data_layer/dataProvider.dart';
import 'package:friendlyeats/data_layer/models/reviews.dart';

class Repository {
  final DataProvider _dataProvider;

  Repository(this._dataProvider);

  Future<List<Product>> getProducts() async {
    DataProvider? _dataProvider;
    var _productsList = await _dataProvider!.getProducts();
    return _productsList;
  }

  Future<void> addProducts() async {
    await _dataProvider.intializeProducts();
  }

  Future<List<Review>> getReviews() async {
    var _reviewsList = await _dataProvider.getReviews();
    return _reviewsList;
  }

  Future<void> addReview(String message, int rating) async {
    final _reviewList = _dataProvider.getReviews() as List<Review>;
    int id = _reviewList.length + 1;
    await _dataProvider.addReview(id, message, rating);
  }

  Future<void> addToCart(
      int id, String name, double price, int qty, int rating) async {
    await _dataProvider.addToCart(id, name, price, qty, rating);
  }

  Future<List<Product>> getCartProducts() async {
    final list = await _dataProvider.getCartProducts();
    return list;
  }

  Future<void> deleteProductFromCart(int id) async {
    await _dataProvider.deleteProductFromCart(id);
  }

  Future<void> updateCartProduct(int pid, int qty, bool isAdd) async {
    await _dataProvider.updateCartProduct(pid, qty, isAdd);
  }
}
