class ReviewRepoModel {
  late final int id;
  late final String message;
  final int rating;

  ReviewRepoModel({required this.id, required this.message, required this.rating});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'rating': rating,
    };
  }

  factory ReviewRepoModel.fromJson(Map<String, dynamic> map) => ReviewRepoModel(
        id: map['id'],
        message: map['message'],
        rating: map['rating'],
      );
}
