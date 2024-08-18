import 'package:Learn_U/core/base_use_case/base_use_case.dart';
import 'package:Learn_U/features/category/Presentation/Manager/categories_bloc/categories_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/categories_bloc/categories_state.dart';
import 'package:Learn_U/features/category/domain/use_cases/categories_uc.dart';
import 'package:bloc/bloc.dart';

import '../../../../../../core/utils/api_helper.dart';

class CategoriesDataBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesUsecase CategoriesUseCase;

  CategoriesDataBloc({required this.CategoriesUseCase})
      : super(CategoriesInitial()) {
    on<CategoriesEvent>((event, emit) async {
      emit(const CategoriesLoadingState());
      final result = await CategoriesUseCase.call(const Noparamiter());
      result.fold(
          (l) => emit(CategoriesSuccessState(l)),
          (r) => emit(CategoriesErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
