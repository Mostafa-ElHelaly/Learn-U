import 'package:Learn_U/core/base_use_case/base_use_case.dart';
import 'package:Learn_U/features/category/Presentation/Manager/categories_bloc/categories_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/categories_bloc/categories_state.dart';
import 'package:Learn_U/features/category/Presentation/Manager/get_reviews_bloc/get_reviews_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/get_reviews_bloc/get_reviews_state.dart';
import 'package:Learn_U/features/category/domain/use_cases/categories_uc.dart';
import 'package:Learn_U/features/category/domain/use_cases/get_reviews_uc.dart';
import 'package:bloc/bloc.dart';

import '../../../../../../core/utils/api_helper.dart';

class GetReviewsBloc extends Bloc<GetReviewsEvent, GetReviewsState> {
  GetReviewsUsecase getreviewsUseCase;

  GetReviewsBloc({required this.getreviewsUseCase})
      : super(GetReviewsInitial()) {
    on<GetReviewsEvent>((event, emit) async {
      emit(const GetReviewsLoadingState());
      final result = await getreviewsUseCase.call(event.course_id);
      result.fold(
          (l) => emit(GetReviewsSuccessState(l)),
          (r) => emit(GetReviewsErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
