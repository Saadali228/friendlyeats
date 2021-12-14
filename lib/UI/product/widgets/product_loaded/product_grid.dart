import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlyeats/bloc/Cart/bloc/cart_bloc.dart';
import 'package:friendlyeats/data_layer/models/products.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          // color: item.color,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.name,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "In Stock " + item.qty.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "\$" + item.price.toString(),
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
                  tag: item.name,
                  child: Image.asset(
                    item.photoUrl,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              BlocListener<CartBloc, CartState>(
                listener: (context, state) {
                  Scaffold.of(context).showSnackBar(
                  state.cartStatus == CartStatus.loaded
                        ? const SnackBar(
                      content: Text('Item Added'),
                      duration: Duration(milliseconds: 300),
                    )
                        : const SnackBar(
                      content: Text('Item Not Added'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                },
                child: InkWell(
                  onTap: () =>
                      BlocProvider.of<CartBloc>(context).add(AddProduct(item),),
                  child: Container(
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
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
