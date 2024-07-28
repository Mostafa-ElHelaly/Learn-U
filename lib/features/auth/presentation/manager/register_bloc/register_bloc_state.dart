import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoadingState extends RegisterState {
  const RegisterLoadingState();
}

final class RegisterErrorState extends RegisterState {
  final String errorMessage;

  const RegisterErrorState({required this.errorMessage});
}

final class RegisterSuccessState extends RegisterState {
  final Unit registerModelResponse;

  const RegisterSuccessState({required this.registerModelResponse});
}
