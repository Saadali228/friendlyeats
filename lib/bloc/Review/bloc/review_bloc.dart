import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friendlyeats/data_layer/models/reviews.dart';
import 'package:friendlyeats/repository/repostory.dart';
import 'package:meta/meta.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final Repository repository;
  ReviewBloc(this.repository) : super(ReviewState()) {
    on<ReviewEvent>(
      (event, emit) async {
        emit(state.copyWith(reviewStatus: ReviewStatus.loading));
        try {
          final reviewList = await repository.getReviews();
          emit(state.copyWith(
              reviewStatus: ReviewStatus.loaded, reviewList: reviewList));
        } catch (_) {
          emit(state.copyWith(reviewStatus: ReviewStatus.error));
        }
      },
    );
    on<AddReview>((event, emit) async {
      emit(state.copyWith(reviewStatus: ReviewStatus.loading));
      try {
        await repository.addReview(event.review);
        final a = state.reviewList;
        a.add(event.review);
        emit(
          state.copyWith(
            reviewStatus: ReviewStatus.loaded,
            reviewList: a,
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
