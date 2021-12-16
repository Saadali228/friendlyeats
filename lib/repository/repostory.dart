import 'package:friendlyeats/data_layer/models/products.dart';
import 'package:friendlyeats/data_layer/dataProvider.dart';
import 'package:friendlyeats/data_layer/models/reviews.dart';

class Repository {
  final DataProvider _dataProvider;

  Repository(this._dataProvider);

  Future<List<Product>> getProducts() async {
    var _productsList = await _dataProvider.getProducts();
    if (_productsList.isEmpty) {
      await _dataProvider.intializeProducts();
      _productsList = await _dataProvider.getProducts();
    }
    return _productsList;
  }

  Future<void> addProducts() async {
    await _dataProvider.intializeProducts();
  }

  Future<List<Review>> getReviews() async {
    var _reviewsList = await _dataProvider.getReviews();
    return _reviewsList;
  }

  Future<void> addReview(Review review) async {
    // final _reviewList = _dataProvider.getReviews() as List<Review>;
    // int id = _reviewList.length + 1;
    await _dataProvider.addReview(review);
  }

  Future<void> addToCart(Product product) async {
    await _dataProvider.addToCart(product);
  }

  Future<List<Product>> getCartProducts() async {
    final list = await _dataProvider.getCartProducts();
    return list;
  }

  Future<void> deleteProductFromCart(Product product) async {
    await _dataProvider.deleteProductFromCart(product);
  }

  Future<void> updateCartProduct(Product product, bool isAdd) async {
    await _dataProvider.updateCartProduct(product, isAdd);
  }
}
