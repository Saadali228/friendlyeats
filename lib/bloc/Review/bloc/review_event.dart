part of 'review_bloc.dart';

@immutable
abstract class ReviewEvent extends Equatable {}

class FetchReview extends ReviewEvent {
  @override
  List<Object?> get props => [];
}

class AddReview extends ReviewEvent {
  // final String message;
  // final int rating;
  final Review review;
  AddReview(this.review);
  @override
  List<Object?> get props => [];
}
