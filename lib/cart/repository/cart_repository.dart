import 'package:friendlyeats/cart/data_layer/cart_data_layer.dart';
import 'package:friendlyeats/product/data_layer/models/product_data_model.dart';

class CartRepository{
    final CartProvider _dataProvider;

  CartRepository(this._dataProvider);
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

  Future<void> incrementCartProduct(Product product) async {
    await _dataProvider.incrementCartProduct(product);
  }

  Future<void> decrementCartProduct(Product product) async {
    await _dataProvider.decrementCartProduct(product);
  }
}