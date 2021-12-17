import 'package:friendlyeats/review/data_layer/models/review_data_model.dart';
import 'package:friendlyeats/review/data_layer/review_data_layer.dart';

class ReviewRepository {
  final ReviewProvider _dataProvider;

  ReviewRepository(this._dataProvider);

  Future<List<Review>> getReviews() async {
    var _reviewsList = await _dataProvider.getReviews();
    return _reviewsList;
  }

  Future<void> addReview(Review review) async {
    // final _reviewList = _dataProvider.getReviews() as List<Review>;
    // int id = _reviewList.length + 1;
    await _dataProvider.addReview(review);
  }
}
