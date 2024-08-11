abstract class BaseState {}

class OtpEmailEvent extends BaseState {
  String email;

  OtpEmailEvent({required this.email});
}
