import 'package:bloc/bloc.dart';

import 'package:Learn_U/core/base_use_case/base_use_case.dart';
import 'package:Learn_U/core/utils/api_helper.dart';
import 'package:Learn_U/features/auth/domain/use_cases/get_countries_uc.dart';
import 'package:Learn_U/features/auth/presentation/manager/get_countries_manager/get_countries_event.dart';
import 'package:Learn_U/features/auth/presentation/manager/get_countries_manager/get_countries_state.dart';

class GetCountriesBloc extends Bloc<GetCountriesEvent, GetCountriesState> {
  GetCountriesUseCase getCountries;

  GetCountriesBloc({
    required this.getCountries,
  }) : super(GetCountriesInitial()) {
    on<GetCountriesEvent>((event, emit) async {
      emit(const GetCountriesLoadingState());
      final result = await getCountries.call(const Noparamiter());
      result.fold(
          (l) => emit(GetCountriesSuccessMessageState(successMessage: l)),
          (r) => emit(GetCountriesErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
