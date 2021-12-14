import 'package:flutter/material.dart';
import 'package:friendlyeats/data_layer/models/products.dart';

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
          return renderGridItem(productList[index]);
        },
        physics: const BouncingScrollPhysics(),
      ),
    );
  }

  Widget renderGridItem(Product item) {
    return GestureDetector(
      onTap: () {},
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
                item.name,
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
