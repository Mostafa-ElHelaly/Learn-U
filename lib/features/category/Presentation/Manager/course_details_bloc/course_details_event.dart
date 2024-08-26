import 'package:equatable/equatable.dart';

class CourseDetailsEvent extends Equatable {
  final int course_id;

  const CourseDetailsEvent({required this.course_id});
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetallCourseDetailsEvent extends CourseDetailsEvent {
  GetallCourseDetailsEvent({required super.course_id});
}
