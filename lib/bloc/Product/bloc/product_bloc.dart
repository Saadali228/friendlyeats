import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friendlyeats/data_layer/models/products.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
