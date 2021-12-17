import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlyeats/product/repository/models/product_repository_model.dart';
import 'package:friendlyeats/product/repository/product_repository.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ProductState()) {
    on<FetchProduct>((event, emit) async {
      emit(
        state.copyWith(
          productState: ProductStatus.loading,
        ),
      );
     // try {
        final productList = await productRepository.getProducts();
        emit(state.copyWith(
            productState: ProductStatus.loaded, productList: productList));
      // } catch (_) {
      //   emit(
      //     state.copyWith(
      //       productState: ProductStatus.error,
      //     ),
      //   );
      // }
    });
    // on(<ProductDetail>(event, emit) async {
    //   emit(ProductLoading());
    // });
  }
}
