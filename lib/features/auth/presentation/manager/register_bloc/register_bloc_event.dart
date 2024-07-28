import 'package:equatable/equatable.dart';

abstract class BaseState {}

class RegisterBlocEvent extends BaseState {
  String? first_name;
  String? middle_name;
  String? last_name;
  String country_id;
  String? education;
  String? mobile;
  String? birthdate;
  String? email;
  String? password;
  RegisterBlocEvent(
      {
      required this.first_name,
      required this.middle_name,
      required this.last_name,
      required this.country_id,
      required this.birthdate,
      required this.education,
      required this.email,
      required this.password,
      required this.mobile});
}
