import 'package:Learn_U/core/base_use_case/base_use_case.dart';
import 'package:Learn_U/features/category/Presentation/Manager/categories_bloc/categories_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/categories_bloc/categories_state.dart';
import 'package:Learn_U/features/category/Presentation/Manager/trainers_bloc/trainers_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/trainers_bloc/trainers_state.dart';
import 'package:Learn_U/features/category/domain/use_cases/categories_uc.dart';
import 'package:Learn_U/features/category/domain/use_cases/trainers_uc.dart';
import 'package:bloc/bloc.dart';

import '../../../../../../core/utils/api_helper.dart';

class TrainersDataBloc extends Bloc<TrainersEvent, TrainersState> {
  TrainersUsecase trainersUsecase;

  TrainersDataBloc({required this.trainersUsecase}) : super(TrainersInitial()) {
    on<TrainersEvent>((event, emit) async {
      emit(const TrainersLoadingState());
      final result = await trainersUsecase.call(const Noparamiter());
      result.fold(
          (l) => emit(TrainersSuccessState(l)),
          (r) => emit(TrainersErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
