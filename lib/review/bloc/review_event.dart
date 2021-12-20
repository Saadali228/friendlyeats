part of 'review_bloc.dart';

class ReviewEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchReview extends ReviewEvent {
  @override
  List<Object?> get props => [];
}

class AddReview extends ReviewEvent {
  final ReviewRepoModel review;
  AddReview(this.review);
  @override
  List<Object?> get props => [];
}
