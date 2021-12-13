part of 'cart_bloc.dart';

enum CartStatus { initial, loading, loaded, error }

class CartState {
  final CartStatus cartStatus;
  final List<Product> cartList;
  CartState({
    this.cartStatus = CartStatus.initial,
    this.cartList = const [],
  });
  CartState copyWith({CartStatus? cartStatus, List<Product>? cartList}) {
    return CartState(
        cartList: cartList ?? this.cartList,
        cartStatus: cartStatus ?? this.cartStatus);
  }

  List<Object> get props => [cartStatus, cartList];
}
