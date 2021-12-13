part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {}

class FetchProduct extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class ProductDetail extends ProductEvent {
  @override
  List<Object?> get props => [];
}
