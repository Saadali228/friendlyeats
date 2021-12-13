class Review {
  final int id;
  final String message;
  final int rating;

  Review({required this.id, required this.message, required this.rating});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'rating': rating,
    };
  }

  factory Review.fromJson(Map<String, dynamic> map) => Review(
        id: map['id'],
        message: map['message'],
        rating: map['rating'],
      );
}
