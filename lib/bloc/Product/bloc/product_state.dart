part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> productList;

  ProductLoaded(this.productList);
  @override
  List<Object> get props => [productList];
}

class ProductError extends ProductState {}
