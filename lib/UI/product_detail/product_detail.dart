import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlyeats/UI/Review/add_review.dart';
import 'package:friendlyeats/UI/Review/review_error.dart';
import 'package:friendlyeats/UI/Review/review_intial.dart';
import 'package:friendlyeats/UI/Review/review_loading.dart';
import 'package:friendlyeats/UI/Review/reviews.dart';
import 'package:friendlyeats/bloc/Product/bloc/product_bloc.dart';
import 'package:friendlyeats/bloc/Review/bloc/review_bloc.dart';
import 'package:friendlyeats/data_layer/models/products.dart';
import 'package:friendlyeats/data_layer/models/reviews.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product item;
  final Function() onAddToCart;
  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  const ProductDetailScreen({
    Key? key,
    required this.item,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Review> _reviews = [];
    // void _showDialog() {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: const Text("Add review"),
    //         // content: const Text(""),
    //         actions: <Widget>[
    //           TextButton(
    //             child: const Text("Submit"),
    //             onPressed: () {},
    //           ),
    //           TextButton(
    //             child: const Text("Close"),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }
    void onCreateReviewPressed() async {
      await showDialog<Review>(
        context: context,
        builder: (_) => ReviewCreateDialog(
          onSave: (id, message, rating) {
            context.read<ReviewBloc>().add(
                  AddReview(
                    Review(id: id, message: message, rating: rating),
                  ),
                );
            Navigator.pop(context);
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: hexToColor(item.color),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 24.0, right: 24.0, bottom: 24.0, top: 48.0),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              height: 120,
              child: Hero(
                tag: item.name,
                child: Image.asset(
                  item.photoUrl,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    // Text(
                    //   item.priceDescription,
                    //   style: const TextStyle(
                    //     fontSize: 18,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                )),
                            Container(
                              color: Colors.grey[200],
                              width: 48,
                              height: 48,
                              child: const Center(
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              r"$ " + item.price.toString(),
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 24.0,
                    // ),
                    Row(
                      children: [
                        Container(
                          width: 300,
                          height: 70,
                          decoration: BoxDecoration(
                            color: hexToColor(item.color),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: const Center(
                            child: Text("Add to cart",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            onCreateReviewPressed();
                          },
                          child: Container(
                            width: 300,
                            height: 70,
                            decoration: BoxDecoration(
                              color: hexToColor(item.color),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Add Review",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<ReviewBloc, ReviewState>(
                      builder: (context, state) {
                        switch (state.reviewStatus) {
                          case ReviewStatus.initial:
                            context.read<ReviewBloc>().add(FetchReview());
                            return const ReviewInitial();
                          case ReviewStatus.loading:
                            return const ReviewLoading();
                          case ReviewStatus.loaded:
                            return ReviewLoaded(
                              reviewList: state.reviewList,
                            );
                          case ReviewStatus.error:
                          default:
                            return const ReviewError();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
