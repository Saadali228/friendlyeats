import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendlyeats/data_layer/models/products.dart';
import 'package:friendlyeats/repository/repostory.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final Repository repositoryProvider;
  ProductBloc(this.repositoryProvider) : super(ProductInitial()) {
    on<FetchProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        final productList = await repositoryProvider.getProducts();
        emit(ProductLoaded(productList));
      } catch (_) {
        emit(ProductError());
      }
    });
    on(<ProductDetail>(event, emit) async {
      emit(ProductLoading());
    });
  }
}
