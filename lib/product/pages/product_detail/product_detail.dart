import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlyeats/product/repository/models/product_repository_model.dart';
import 'package:friendlyeats/review/bloc/review_bloc.dart';
import 'package:friendlyeats/review/pages/add_review.dart';
import 'package:friendlyeats/review/pages/review_error.dart';
import 'package:friendlyeats/review/pages/review_intial.dart';
import 'package:friendlyeats/review/pages/review_loading.dart';
import 'package:friendlyeats/review/pages/reviews.dart';
import 'package:friendlyeats/review/repository/models/review_repository_model.dart';


class ProductDetailScreen extends StatelessWidget {
  final ProductRepoModel item;
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
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
                Container(
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
                        const SizedBox(
                          height: 24.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Column(
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
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: onAddToCart,
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
                                    "Add to cart",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<ReviewBloc, ReviewState>(
            builder: (context, state) {
              switch (state.reviewStatus) {
                case ReviewStatus.initial:
                  context.read<ReviewBloc>().add(FetchReview());
                  return const SliverToBoxAdapter(child: ReviewInitial());
                case ReviewStatus.loading:
                  return const SliverToBoxAdapter(child: ReviewLoading());
                case ReviewStatus.loaded:
                  return ReviewLoaded(
                    reviewList: state.reviewList,
                  );
                case ReviewStatus.error:
                default:
                  return const SliverToBoxAdapter(child: ReviewError());
              }
            },
          ),
        ],
      ),
    );
  }
}
