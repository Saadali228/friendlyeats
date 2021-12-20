import 'package:friendlyeats/review/data_layer/models/review_data_model.dart';
import 'package:friendlyeats/review/data_layer/review_data_layer.dart';
import 'package:friendlyeats/review/repository/models/review_repository_model.dart';

class ReviewRepository {
  final ReviewProvider _dataProvider;
  ReviewRepository(this._dataProvider);

  Future<List<ReviewRepoModel>> getReviews() async {
    var _reviewsList = await _dataProvider.getReviews();
    return _reviewsList
        .map(
          (e) => ReviewRepoModel(
            id: e.id,
            message: e.message,
            rating: e.rating,
          ),
        )
        .toList();
  }

  Future<void> addReview(ReviewRepoModel review) async {
    await _dataProvider.addReview(
      ReviewDataModel(
          id: review.id, message: review.message, rating: review.rating),
    );
  }
}
