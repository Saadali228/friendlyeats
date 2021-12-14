part of 'cart_bloc.dart';

enum CartStatus { initial, loading, loaded, error }
enum AddToCartStatus { initial, loading, loaded, error }

class CartState {
  final CartStatus cartStatus;
  final List<Product> cartList;
  final AddToCartStatus addToCartStatus;

  CartState({
    this.cartStatus = CartStatus.initial,
    this.cartList = const [],
    this.addToCartStatus = AddToCartStatus.initial,
  });

  CartState copyWith({
    CartStatus? cartStatus,
    List<Product>? cartList,
    AddToCartStatus? addToCartStatus,
  }) {
    return CartState(
      cartList: cartList ?? this.cartList,
      cartStatus: cartStatus ?? this.cartStatus,
      addToCartStatus: addToCartStatus ?? this.addToCartStatus,
    );
  }

  List<Object> get props => [cartStatus, cartList, addToCartStatus];
}
