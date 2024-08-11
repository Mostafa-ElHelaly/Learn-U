import 'package:Learn_U/core/base_use_case/base_use_case.dart';
import 'package:Learn_U/features/auth/domain/use_cases/countries_uc.dart';
import 'package:Learn_U/features/auth/presentation/manager/countries_bloc/countries_event.dart';
import 'package:Learn_U/features/auth/presentation/manager/countries_bloc/countries_state.dart';
import 'package:bloc/bloc.dart';
import '../../../../../core/utils/api_helper.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesUsecase CountriesUseCase;

  CountriesBloc({required this.CountriesUseCase}) : super(CountriesInitial()) {
    on<CountriesEvent>((event, emit) async {
      emit(const CountriesLoadingState());
      final result = await CountriesUseCase.call(const Noparamiter());
      result.fold(
          (l) => emit(CountriesSuccessState(l)),
          (r) => emit(CountriesErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
