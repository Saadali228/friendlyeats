import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlyeats/product/bloc/product_bloc.dart';
import '../../cart/pages/cart_page.dart';
import 'product_page.dart';

var scaffoldKey = GlobalKey<ScaffoldState>();

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const CartDrawer(),
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
                    context.read<ProductBloc>().add(
                          FetchProduct(),
                        );
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

class ProductInitial extends StatelessWidget {
  const ProductInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Products are Empty!', style: TextStyle(fontSize: 64)),
      ],
    );
  }
}

class ProductLoading extends StatelessWidget {
  const ProductLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}

class ProductError extends StatelessWidget {
  const ProductError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Something went wrong!', style: TextStyle(fontSize: 64)),
      ],
    );
  }
}
