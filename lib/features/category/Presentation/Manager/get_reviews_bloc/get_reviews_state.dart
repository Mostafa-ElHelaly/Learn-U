import 'package:Learn_U/features/category/data/model/reviews_model.dart';
import 'package:equatable/equatable.dart';

abstract class GetReviewsState extends Equatable {
  const GetReviewsState();

  @override
  List<Object> get props => [];
}

final class GetReviewsInitial extends GetReviewsState {}

final class GetReviewsLoadingState extends GetReviewsState {
  const GetReviewsLoadingState();
}

final class GetReviewsErrorState extends GetReviewsState {
  final String errorMessage;

  const GetReviewsErrorState({required this.errorMessage});
}

final class GetReviewsSuccessState extends GetReviewsState {
  final List<ReviewsModel> GetReviews;
  const GetReviewsSuccessState(this.GetReviews);
}
