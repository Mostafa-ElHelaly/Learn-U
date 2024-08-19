import 'package:Learn_U/core/base_use_case/base_use_case.dart';
import 'package:Learn_U/features/Search_Page/domain/use_cases/search_uc.dart';
import 'package:Learn_U/features/Search_Page/presentation/manager/search_bloc/countries_event.dart';
import 'package:bloc/bloc.dart';
import 'package:Learn_U/core/utils/api_helper.dart';
import 'package:Learn_U/features/Search_Page/presentation/manager/search_bloc/countries_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchUseCase searchUseCase;

  SearchBloc({required this.searchUseCase}) : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      emit(const SearchLoadingState());
      final result = await searchUseCase.call(const Noparamiter());
      result.fold(
          (l) => emit(SearchSuccessState(l)),
          (r) => emit(SearchErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
