import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class OtpEmailState extends Equatable {
  const OtpEmailState();

  @override
  List<Object> get props => [];
}

final class OtpEmailInitial extends OtpEmailState {}

final class OtpEmailLoadingState extends OtpEmailState {
  const OtpEmailLoadingState();
}

final class OtpEmailErrorState extends OtpEmailState {
  final String errorMessage;

  const OtpEmailErrorState({required this.errorMessage});
}

final class OtpEmailSuccessState extends OtpEmailState {
  final Unit OtpEmailModelResponse;

  const OtpEmailSuccessState({required this.OtpEmailModelResponse});
}
