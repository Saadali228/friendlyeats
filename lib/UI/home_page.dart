import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlyeats/UI/item.dart';
import 'package:friendlyeats/UI/item_description.dart';
import 'package:friendlyeats/UI/product/widgets/product_error.dart';
import 'package:friendlyeats/UI/product/widgets/product_initial.dart';
import 'package:friendlyeats/UI/product/widgets/product_loaded.dart';
import 'package:friendlyeats/UI/product/widgets/product_loading.dart';
import 'package:friendlyeats/bloc/Product/bloc/product_bloc.dart';
import 'package:friendlyeats/data_layer/models/products.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "FriendlyEats",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                    size: 36,
                  ),
                ],
              ),
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                switch (state.productState) {
                  case ProductStatus.initial:
                    context.read<ProductBloc>().add(FetchProduct());
                    return const ProductInitial();
                  case ProductStatus.loading:
                    return const ProductLoading();
                  case ProductStatus.loaded:
                    return ProductLoaded(
                      productList: state.productList,
                    );
                  case ProductStatus.error:
                  default:
                    return const ProductError();
                }
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
