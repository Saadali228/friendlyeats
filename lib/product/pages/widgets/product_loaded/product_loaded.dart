import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlyeats/cart/bloc/cart_bloc.dart';
import 'package:friendlyeats/product/pages/widgets/product_loaded/product_grid.dart';
import 'package:friendlyeats/product/repository/models/product_repository_model.dart';

class ProductLoaded extends StatelessWidget {
  const ProductLoaded({Key? key, required this.productList}) : super(key: key);
  final List<ProductRepoModel> productList;

  @override
  Widget build(BuildContext context) {
    if (productList.isEmpty) {
      return const Text('Products are Empty!', style: TextStyle(fontSize: 64));
    }
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.addToCartStatus != current.addToCartStatus,
      listener: (context, state) {
        if (state.addToCartStatus == AddToCartStatus.loaded) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item Added'),
              duration: Duration(milliseconds: 300),
            ),
          );
          context.read<CartBloc>().add(AddCartInitial());
        }
        if (state.addToCartStatus == AddToCartStatus.error) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item Not Added'),
              duration: Duration(milliseconds: 300),
            ),
          );
          context.read<CartBloc>().add(AddCartInitial());
        }
      },
      child: Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 1.4 / 1.5,
            maxCrossAxisExtent: 350,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
          ),
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductGrid(
              item: productList[index],
              onAddToCart: () {
                context.read<CartBloc>().add(
                      AddProduct(productList[index]),
                    );
              },
            );
          },
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
