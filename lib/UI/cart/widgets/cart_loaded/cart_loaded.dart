
import 'package:flutter/material.dart';
import 'package:friendlyeats/UI/cart/widgets/cart_loaded/cart_list.dart';
import 'package:friendlyeats/data_layer/models/products.dart';

class CartLoaded extends StatelessWidget {
  const CartLoaded({Key? key, required this.cartList}) : super(key: key);
  final List<Product> cartList;

  @override
  Widget build(BuildContext context) {
    if (cartList.isEmpty) {
      return const Text('Cart is Empty!', style: TextStyle(fontSize: 64));
    }
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: cartList.length,
        itemBuilder: (context, index) {
          return CartList(item: cartList[index]);
        },
      ),
    );
  }
}