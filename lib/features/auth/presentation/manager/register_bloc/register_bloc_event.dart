import 'package:equatable/equatable.dart';

abstract class BaseState {}

class RegisterBlocEvent extends BaseState {
  String? fullName;
  String? birthdate;
  String? email;
  String? password;
  String? mobile;
  RegisterBlocEvent(
      {
      required this.fullName,

      required this.birthdate,
      required this.email,
      required this.password,
      required this.mobile});
}
