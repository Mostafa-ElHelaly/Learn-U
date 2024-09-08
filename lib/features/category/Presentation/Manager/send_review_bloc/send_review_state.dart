import 'package:Learn_U/features/category/data/model/reviews_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class SendReviewsState extends Equatable {
  const SendReviewsState();

  @override
  List<Object> get props => [];
}

final class SendReviewsInitial extends SendReviewsState {}

final class SendReviewsLoadingState extends SendReviewsState {
  const SendReviewsLoadingState();
}

final class SendReviewsErrorState extends SendReviewsState {
  final String errorMessage;

  const SendReviewsErrorState({required this.errorMessage});
}

final class SendReviewsSuccessState extends SendReviewsState {
  final Unit SendReviews;
  const SendReviewsSuccessState(this.SendReviews);
}
