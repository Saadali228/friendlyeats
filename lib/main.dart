import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    size: 28,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.all(20),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 24.0, right: 16.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                childAspectRatio: 1.3 / 1.5,
                crossAxisCount: 4,
                crossAxisSpacing: 30,
                mainAxisSpacing: 20,
                children:
                    getGridItems().map((item) => renderGridItem(item)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderGridItem(Item item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemDescription(item: item)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                item.title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    r"$ " + item.price,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Expanded(
                child: Hero(
                  tag: item.title,
                  child: Image.asset(
                    item.imageUrl,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          "Add to cart",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Icon(
                          Icons.add_shopping_cart,
                          color: Colors.black,
                          size: 16,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
