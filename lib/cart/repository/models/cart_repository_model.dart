import 'package:equatable/equatable.dart';

class CartRepoModel extends Equatable {
  final int id;
  final String name;
  final int qty;
  final num price;
  final num totalPrice;

  const CartRepoModel({
    required this.id,
    required this.name,
    required this.price,
    required this.qty,
    required this.totalPrice,
  });
  // Cart copyWith({
  //   num subTotal,
  // }) {
  //   return Cart();
  // }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      "qty": qty,
      "totalPrice": totalPrice,
    };
  }

  factory CartRepoModel.fromJson(Map<String, dynamic> map) => CartRepoModel(
        id: map['id'],
        name: map['name'],
        price: map['price'],
        qty: map['qty'],
        totalPrice: map['totalPrice'],
      );

  @override
  List<Object?> get props => [];
}
