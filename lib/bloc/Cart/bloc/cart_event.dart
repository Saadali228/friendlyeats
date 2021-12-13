part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {}

class DisplayProducts extends CartEvent {
  @override
  List<Object?> get props => [];
}

class UpdateProduct extends CartEvent {
  @override
  List<Object?> get props => [];
}

class DeleteProduct extends CartEvent {
  @override
  List<Object?> get props => [];
}
