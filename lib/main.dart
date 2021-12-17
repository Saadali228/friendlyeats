import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import 'cart/bloc/cart_bloc.dart';
import 'product/bloc/product_bloc.dart';
import 'product/pages/home_page.dart';
import 'review/bloc/review_bloc.dart';

void main() {
  DataProvider _dataProvider = DataProvider();
  Repository repository = Repository(_dataProvider);
  runApp(
    RepositoryProvider.value(
      value: repository,
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
