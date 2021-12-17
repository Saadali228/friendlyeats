import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlyeats/product/bloc/product_bloc.dart';

import 'drawer.dart';
import 'widgets/product_error.dart';
import 'widgets/product_initial.dart';
import 'widgets/product_loaded/product_loaded.dart';
import 'widgets/product_loading.dart';



var scaffoldKey = GlobalKey<ScaffoldState>();

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const CustomDrawer(),
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
                children: <Widget>[
                  const Text(
                    "FriendlyEats",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      scaffoldKey.currentState!.openEndDrawer();
                    },
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                      size: 36,
                    ),
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
