class ReviewDataModel {
  late final int id;
  late final String message;
  final int rating;

  ReviewDataModel({required this.id, required this.message, required this.rating});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'rating': rating,
    };
  }

  factory ReviewDataModel.fromJson(Map<String, dynamic> map) => ReviewDataModel(
        id: map['id'],
        message: map['message'],
        rating: map['rating'],
      );
}
