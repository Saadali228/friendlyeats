part of 'review_bloc.dart';

enum ReviewStatus { initial, loading, loaded, error }

class ReviewState {
  final ReviewStatus reviewStatus;
  final List<Review> reviewList;
  ReviewState({
    this.reviewStatus = ReviewStatus.initial,
    this.reviewList = const [],
  });
  ReviewState copyWith({ReviewStatus? reviewStatus, List<Review>? reviewList}) {
    return ReviewState(
        reviewList: reviewList ?? this.reviewList,
        reviewStatus: reviewStatus ?? this.reviewStatus);
  }

  List<Object> get props => [reviewStatus, reviewList];
}
