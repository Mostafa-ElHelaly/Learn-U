import 'package:Learn_U/core/base_use_case/base_use_case.dart';
import 'package:Learn_U/features/category/Presentation/Manager/categories_bloc/categories_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/categories_bloc/categories_state.dart';
import 'package:Learn_U/features/category/Presentation/Manager/course_details_bloc/course_details_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/course_details_bloc/course_details_state.dart';
import 'package:Learn_U/features/category/domain/use_cases/categories_uc.dart';
import 'package:Learn_U/features/category/domain/use_cases/course_details_uc.dart';
import 'package:bloc/bloc.dart';

import '../../../../../../core/utils/api_helper.dart';

class CourseDetailsDataBloc
    extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  CourseDetailsUsecase categoriesUseCase;

  CourseDetailsDataBloc({required this.categoriesUseCase})
      : super(CourseDetailsInitial()) {
    on<CourseDetailsEvent>((event, emit) async {
      emit(const CourseDetailsLoadingState());
      final result = await categoriesUseCase.call(event.course_id);
      result.fold(
          (l) => emit(CourseDetailsSuccessState(l)),
          (r) => emit(CourseDetailsErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
