class Review {
  final int id;
  final String message;
  final int rating;

  Review({required this.id, required this.message, required this.rating});

   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'messsage': message,
      'rating': rating,
    };
  }
}
