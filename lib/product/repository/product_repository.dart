import 'package:friendlyeats/product/data_layer/models/product_data_model.dart';
import 'package:friendlyeats/product/data_layer/product_data_layer.dart';

class ProductRepository {
  final ProductProvider _dataProvider;

  ProductRepository(this._dataProvider);
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
}
