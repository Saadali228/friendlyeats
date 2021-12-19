
class ProductRepoModel {
  final int id;
  final String name;
  final num price;
  String color;
  int qty;
  final int rating;
  final String photoUrl;

  ProductRepoModel({
    required this.id,
    required this.name,
    required this.price,
    required this.color,
    required this.rating,
    required this.qty,
    required this.photoUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'color': color,
      'rating': rating,
      'qty': qty,
      'photoUrl': photoUrl,
    };
  }

  factory ProductRepoModel.fromJson(Map<String, dynamic> map) {
    return ProductRepoModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      color: map['color'],
      qty: map['qty'] == null ? 1 : map['qty'],
      rating: map['rating'],
      photoUrl: map['photoUrl'],
    );
  }
}
