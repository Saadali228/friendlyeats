part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoadSuccess extends ProductState {
  final Product? product;

  ProductLoadSuccess(this.product) : assert(product != null);
  @override
  List<Object> get props => [product!];
}

class ProductLoadFailure extends ProductState {}
