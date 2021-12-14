import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlyeats/UI/cart/widgets/cart_loaded/cart_list.dart';
import 'package:friendlyeats/bloc/Cart/bloc/cart_bloc.dart';
import 'package:friendlyeats/data_layer/models/products.dart';

class CartLoaded extends StatelessWidget {
  const CartLoaded({Key? key, required this.cartList}) : super(key: key);
  final List<Product> cartList;

  @override
  Widget build(BuildContext context) {
    if (cartList.isEmpty) {
      return const Text('Cart is Empty!', style: TextStyle(fontSize: 64));
    }
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state.cartStatus == CartStatus.loaded) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item Removed'),
              duration: Duration(milliseconds: 300),
            ),
          );
        }
        if (state.cartStatus == CartStatus.error) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item Not Removed'),
              duration: Duration(milliseconds: 300),
            ),
          );
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
