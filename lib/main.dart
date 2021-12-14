import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlyeats/UI/home_page.dart';
import 'package:friendlyeats/UI/item.dart';
import 'package:friendlyeats/UI/item_description.dart';
import 'package:friendlyeats/bloc/Cart/bloc/cart_bloc.dart';
import 'package:friendlyeats/bloc/Product/bloc/product_bloc.dart';
import 'package:friendlyeats/bloc/Review/bloc/review_bloc.dart';
import 'package:friendlyeats/data_layer/dataProvider.dart';
import 'package:friendlyeats/repository/repostory.dart';
import 'package:google_fonts/google_fonts.dart';

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
