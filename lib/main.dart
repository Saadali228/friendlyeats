import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlyeats/cart/data_layer/cart_data_layer.dart';
import 'package:friendlyeats/cart/repository/cart_repository.dart';
import 'package:friendlyeats/product/data_layer/product_data_layer.dart';
import 'package:friendlyeats/product/repository/product_repository.dart';
import 'package:friendlyeats/review/data_layer/review_data_layer.dart';
import 'package:friendlyeats/review/repository/review_repository.dart';

import 'package:google_fonts/google_fonts.dart';

import 'cart/bloc/cart_bloc.dart';
import 'product/bloc/product_bloc.dart';
import 'product/pages/home_page.dart';
import 'review/bloc/review_bloc.dart';
// MultiRepositoryProvider(
// providers: [
// RepositoryProvider<RepositoryA>(
// create: (context) => RepositoryA(),
// ),
// RepositoryProvider<RepositoryB>(
// create: (context) => RepositoryB(),
// ),
// RepositoryProvider<RepositoryC>(
// create: (context) => RepositoryC(),
// ),
// ],
// child: ChildA(),
// )
void main() {
  ProductProvider _productProvider = ProductProvider();
  ProductRepository productRepository = ProductRepository(_productProvider);
  ReviewProvider _reviewProvider = ReviewProvider();
  ReviewRepository reviewRepository = ReviewRepository(_reviewProvider);
  CartProvider _cartProvider = CartProvider();
  CartRepository cartRepository = CartRepository(_cartProvider);
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: productRepository),
        RepositoryProvider.value(value: reviewRepository),
        RepositoryProvider.value(value: cartRepository),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(
            RepositoryProvider.of(context),
          ),
        ),
        BlocProvider(
          create: (context) => CartBloc(
            RepositoryProvider.of(context),
          ),
        ),
        BlocProvider(
          create: (context) => ReviewBloc(
            RepositoryProvider.of(context),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'FriendlyEats',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
      ),
    );
  }
}
