part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartProductUpdate extends CartState {}

class CartProductDelete extends CartState {}

class CartLoaded extends CartState {
  final List<Product> cartList;

  CartLoaded(this.cartList);
  @override
  List<Object> get props => [cartList];
}

class CartError extends CartState {}

