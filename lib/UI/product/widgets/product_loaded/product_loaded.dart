import 'package:flutter/material.dart';
import 'package:friendlyeats/UI/product/widgets/product_loaded/product_grid.dart';
import 'package:friendlyeats/bloc/Cart/bloc/cart_bloc.dart';
import 'package:friendlyeats/data_layer/models/products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductLoaded extends StatelessWidget {
  const ProductLoaded({Key? key, required this.productList}) : super(key: key);
  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    if (productList.isEmpty) {
      return const Text('Products are Empty!', style: TextStyle(fontSize: 64));
    }
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.4 / 1.5,
          crossAxisCount: 4,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ProductGrid(item: productList[index]);
        },
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
