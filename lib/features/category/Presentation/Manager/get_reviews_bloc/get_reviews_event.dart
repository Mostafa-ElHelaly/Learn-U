import 'package:equatable/equatable.dart';

class GetReviewsEvent extends Equatable {
  final int course_id;

  const GetReviewsEvent({required this.course_id});
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetallGetReviewEvent extends GetReviewsEvent {
  GetallGetReviewEvent({required super.course_id});
}
