import 'package:bloc/bloc.dart';

import '../../../../../core/base_use_case/base_use_case.dart';
import '../../../../../core/utils/api_helper.dart';
import '../../../domain/use_cases/get_countries_uc.dart';
import 'get_countries_event.dart';
import 'get_countries_state.dart';

class GetCountries extends Bloc<GetCountriesEvent, GetCountriesState> {
  CountriesUseCase getCountries;

  GetCountries({
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
