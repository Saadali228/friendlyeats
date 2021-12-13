class Product {
  final int id;
  final String name;
  final double price;
   int qty;
  final int rating;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    this.qty = 1,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'rating': rating,
      'qty': qty,
    };
  }

  factory Product.fromJson(Map<String, dynamic> map) => Product(
        id: map['id'],
        name: map['name'],
        price: map['price'],
        qty: map['qty'],
        rating: map['rating'],
      );
}
