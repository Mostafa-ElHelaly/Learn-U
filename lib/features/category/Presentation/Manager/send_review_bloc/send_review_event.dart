import 'package:equatable/equatable.dart';

abstract class SendReviewsEvent {}

class SendallSendReviewEvent extends SendReviewsEvent {
  int? course_id;
  int? review_value;
  String? review_message;

  SendallSendReviewEvent({
    this.course_id,
    this.review_value,
    this.review_message,
  });
}
