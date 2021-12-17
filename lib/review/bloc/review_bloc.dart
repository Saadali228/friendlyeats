import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friendlyeats/review/repository/models/review_repository_model.dart';
import 'package:friendlyeats/review/repository/review_repository.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ReviewRepository reviewRepository;
  ReviewBloc(this.reviewRepository) : super(ReviewState()) {
    on<FetchReview>(
      (event, emit) async {
        emit(state.copyWith(reviewStatus: ReviewStatus.loading));
        // try {
        final reviewList = await reviewRepository.getReviews();
        emit(state.copyWith(
            reviewStatus: ReviewStatus.loaded, reviewList: reviewList));
        // } catch (_) {
        //   emit(state.copyWith(reviewStatus: ReviewStatus.error));
        // }
      },
    );
    on<AddReview>((event, emit) async {
      // emit(state.copyWith(reviewStatus: ReviewStatus.loading));
      try {
        await reviewRepository.addReview(event.review);
        final newReviewList = state.reviewList;
        newReviewList.add(event.review);
        emit(
          state.copyWith(
            reviewStatus: ReviewStatus.loaded,
            reviewList: newReviewList,
          ),
        );
      } catch (_) {
        emit(
          state.copyWith(
            reviewStatus: ReviewStatus.error,
          ),
        );
      }
    });
  }
}
