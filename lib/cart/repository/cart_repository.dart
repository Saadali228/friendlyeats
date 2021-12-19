import 'package:friendlyeats/cart/data_layer/cart_data_layer.dart';
import 'package:friendlyeats/product/repository/models/product_repository_model.dart';

class CartRepository{
    final CartProvider _dataProvider;

  CartRepository(this._dataProvider);
  Future<void> addToCart(ProductRepoModel product) async {
    await _dataProvider.addToCart(product);
  }

  Future<List<ProductRepoModel>> getCartProducts() async {
    final list = await _dataProvider.getCartProducts();
    return list;
  }

  Future<void> deleteProductFromCart(ProductRepoModel product) async {
    await _dataProvider.deleteProductFromCart(product);
  }

  Future<void> incrementCartProduct(ProductRepoModel product) async {
    await _dataProvider.incrementCartProduct(product);
  }

  Future<void> decrementCartProduct(ProductRepoModel product) async {
    await _dataProvider.decrementCartProduct(product);
  }
}