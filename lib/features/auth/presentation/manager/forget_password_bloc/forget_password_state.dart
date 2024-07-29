import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoadingState extends ForgetPasswordState {
  const ForgetPasswordLoadingState();
}

final class ForgetPasswordErrorState extends ForgetPasswordState {
  final String errorMessage;

  const ForgetPasswordErrorState({required this.errorMessage});
}

final class ForgetPasswordSuccessState extends ForgetPasswordState {
  final Unit ForgetPasswordModelResponse;

  const ForgetPasswordSuccessState({required this.ForgetPasswordModelResponse});
}
