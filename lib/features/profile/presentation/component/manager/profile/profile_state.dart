import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:Learn_U/features/profile/data/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

final class UsersInitial extends UsersState {}

final class UsersLoadingState extends UsersState {
  const UsersLoadingState();
}

final class UsersErrorState extends UsersState {
  final String errorMessage;

  const UsersErrorState({required this.errorMessage});
}

final class UsersSuccessState extends UsersState {
  final List<UserModel> users;
  const UsersSuccessState(this.users);
}
