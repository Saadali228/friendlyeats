class Product {
  final int id;
  final String name;
  final double price;
  final int rating;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'rating': rating,
    };
  }

  factory Product.fromJson(Map<String, dynamic> map) => Product(
        id: map['id'],
        name: map['name'],
        price: map['price'],
        rating: map['rating'],
      );
}
