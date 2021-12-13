import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlyeats/data_layer/models/products.dart';
import 'package:friendlyeats/repository/repostory.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final Repository repositoryProvider;
  ProductBloc(this.repositoryProvider) : super(ProductState()) {
    on<FetchProduct>((event, emit) async {
      emit(
        state.copyWith(
          productState: ProductStatus.loading,
        ),
      );
      try {
        final productList = await repositoryProvider.getProducts();
        emit(state.copyWith(
            productState: ProductStatus.loaded, productList: productList));
      } catch (_) {
        emit(
          state.copyWith(
            productState: ProductStatus.error,
          ),
        );
      }
    });
    // on(<ProductDetail>(event, emit) async {
    //   emit(ProductLoading());
    // });
  }
}
