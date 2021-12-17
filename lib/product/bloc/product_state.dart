part of 'product_bloc.dart';

enum ProductStatus { initial, loading, loaded, error }

class ProductState {
  final ProductStatus productState;
  final List<Product> productList;
  ProductState({
    this.productState = ProductStatus.initial,
    this.productList = const [],
  });
  ProductState copyWith(
      {ProductStatus? productState, List<Product>? productList}) {
    return ProductState(
        productList: productList ?? this.productList,
        productState: productState ?? this.productState);
  }

  List<Object> get props => [productState, productList];
}
