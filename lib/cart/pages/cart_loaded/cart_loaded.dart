import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlyeats/cart/bloc/cart_bloc.dart';
import 'package:friendlyeats/cart/pages/cart_loaded/cart_list.dart';
import 'package:friendlyeats/product/repository/models/product_repository_model.dart';

class CartLoaded extends StatelessWidget {
  const CartLoaded({Key? key, required this.cartList}) : super(key: key);
  final List<ProductRepoModel> cartList;

  @override
  Widget build(BuildContext context) {
    if (cartList.isEmpty) {
      return const Text('Cart is Empty!', style: TextStyle(fontSize: 64));
    }
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.deleteFromCartStatus != current.deleteFromCartStatus,
      listener: (context, state) {
        if (state.deleteFromCartStatus == DeleteFromCartStatus.loaded) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item Removed'),
              duration: Duration(milliseconds: 300),
            ),
          );
          context.read<CartBloc>().add(DeleteCartInitial());
        }
        if (state.deleteFromCartStatus == DeleteFromCartStatus.error) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item Not Removed'),
              duration: Duration(milliseconds: 300),
            ),
          );
          context.read<CartBloc>().add(DeleteCartInitial());
        }
      },
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: cartList.length,
        itemBuilder: (context, index) {
          return CartList(
            item: cartList[index],
            onDelete: () => context.read<CartBloc>().add(
                  DeleteProduct(cartList[index]),
                ),
          );
        },
      ),
    );
  }
}
