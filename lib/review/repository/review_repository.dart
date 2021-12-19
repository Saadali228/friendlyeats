import 'package:friendlyeats/review/data_layer/review_data_layer.dart';
import 'package:friendlyeats/review/repository/models/review_repository_model.dart';

class ReviewRepository {
  final ReviewProvider _dataProvider;

  ReviewRepository(this._dataProvider);

  Future<List<Review>> getReviews() async {
    var _reviewsList = await _dataProvider.getReviews();
    return _reviewsList;
  }

  Future<void> addReview(Review review) async {
    await _dataProvider.addReview(review);
  }
}
