import 'package:Learn_U/core/base_use_case/base_use_case.dart';
import 'package:Learn_U/features/auth/presentation/manager/countries_bloc/countries_event.dart';
import 'package:Learn_U/features/auth/presentation/manager/countries_bloc/countries_state.dart';
import 'package:Learn_U/features/profile/domain/use_cases/profile_uc.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/profile/profile_event.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/profile/profile_state.dart';
import 'package:bloc/bloc.dart';

import '../../../../../../core/utils/api_helper.dart';

class ProfileBloc extends Bloc<UsersEvent, UsersState> {
  ProfileUsecase ProfileUseCase;

  ProfileBloc({required this.ProfileUseCase}) : super(UsersInitial()) {
    on<UsersEvent>((event, emit) async {
      emit(const UsersLoadingState());
      final result = await ProfileUseCase.call(const Noparamiter());
      result.fold(
          (l) => emit(UsersSuccessState(l)),
          (r) => emit(
              UsersErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
