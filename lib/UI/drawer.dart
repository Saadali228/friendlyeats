import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlyeats/UI/cart/widgets/cart_error.dart';
import 'package:friendlyeats/UI/cart/widgets/cart_inital.dart';
import 'package:friendlyeats/UI/cart/widgets/cart_loaded/cart_loaded.dart';
import 'package:friendlyeats/UI/cart/widgets/cart_loading.dart';
import 'package:friendlyeats/UI/home_page.dart';
import 'package:friendlyeats/bloc/Cart/bloc/cart_bloc.dart';
import 'package:friendlyeats/data_layer/models/products.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            switch (state.cartStatus) {
              case CartStatus.initial:
                context.read<CartBloc>().add(
                      DisplayProducts(),
                    );
                return const CartInitial();
              case CartStatus.loading:
                return const CartLoading();
              case CartStatus.loaded:
                return CartLoaded(
                  cartList: state.cartList,
                );
              case CartStatus.error:
              default:
                return const CartError();
            }
          },
        ),
      ),
    );
  }
}
