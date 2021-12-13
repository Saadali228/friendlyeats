import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friendlyeats/data_layer/models/products.dart';
import 'package:friendlyeats/repository/repostory.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Repository repository;

  CartBloc(this.repository) : super(CartInitial()) {
    on<DisplayProducts>((event, emit) async {
      emit(CartLoading());
      try {
        final _cartList = await repository.getCartProducts();
        emit(CartLoaded(_cartList));
      } catch (_) {
        emit(CartError());
      }
    });

    on<CartProductUpdate>((event, emit) async {
      try {
        final _updatedCartList = await repository.updateCartProduct(
            pid, qty, isAdd)
      }
    });
  }
}
