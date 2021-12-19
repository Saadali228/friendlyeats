import 'package:friendlyeats/product/data_layer/product_data_layer.dart';
import 'package:friendlyeats/product/repository/models/product_repository_model.dart';

class ProductRepository {
  final ProductProvider _dataProvider;

  Future<void> initializeProducts() async {
    await _dataProvider.initializeProducts();
  }
  
  ProductRepository(this._dataProvider);
  Future<List<ProductRepoModel>> getProducts() async {
    var _productsList = await _dataProvider.getProducts();
    if (_productsList.isEmpty) {
      await _dataProvider.initializeProducts();
      _productsList = await _dataProvider.getProducts();
    }
    return _productsList;
  }
}
