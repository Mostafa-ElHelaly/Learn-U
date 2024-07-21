import 'package:equatable/equatable.dart';

abstract class BaseState {}

class RegisterBlocEvent extends BaseState {
  String? country_id;
  String? first_name;
  String? middle_name;
  String? last_name;
  String? birthdate;
  String? education;
  String? email;
  String? password;
  String? mobile;
  RegisterBlocEvent(
      {required this.country_id,
      required this.first_name,
      required this.middle_name,
      required this.last_name,
      required this.birthdate,
      required this.education,
      required this.email,
      required this.password,
      required this.mobile});
}
