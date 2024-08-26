import 'package:Learn_U/features/category/data/model/course_details_model.dart';
import 'package:equatable/equatable.dart';

abstract class CourseDetailsState extends Equatable {
  const CourseDetailsState();

  @override
  List<Object> get props => [];
}

final class CourseDetailsInitial extends CourseDetailsState {}

final class CourseDetailsLoadingState extends CourseDetailsState {
  const CourseDetailsLoadingState();
}

final class CourseDetailsErrorState extends CourseDetailsState {
  final String errorMessage;

  const CourseDetailsErrorState({required this.errorMessage});
}

final class CourseDetailsSuccessState extends CourseDetailsState {
  final CourseDetailsModel CourseDetails;
  const CourseDetailsSuccessState(this.CourseDetails);
}
