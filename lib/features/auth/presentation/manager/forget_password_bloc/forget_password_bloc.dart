import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:Learn_U/features/auth/domain/use_cases/forget_pass_uc.dart';
import 'package:Learn_U/features/auth/presentation/manager/forget_password_bloc/forget_password_event.dart';
import 'package:Learn_U/features/auth/presentation/manager/forget_password_bloc/forget_password_state.dart';
import 'package:Learn_U/features/auth/presentation/manager/register_bloc/register_bloc_event.dart';
import 'package:Learn_U/features/auth/presentation/manager/register_bloc/register_bloc_state.dart';
import 'package:bloc/bloc.dart';

import '../../../../../core/utils/api_helper.dart';
import '../../../domain/use_cases/register_uc.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordUseCase forgetPasswordUseCase;

  ForgetPasswordBloc({required this.forgetPasswordUseCase})
      : super(ForgetPasswordInitial()) {
    on<ForgetPasswordEvent>((event, emit) async {
      emit(const ForgetPasswordLoadingState());
      final result = await forgetPasswordUseCase.call(LoginModel(
        email: event.email,
      ));
      result.fold(
          (l) =>
              emit(ForgetPasswordSuccessState(ForgetPasswordModelResponse: l)),
          (r) => emit(ForgetPasswordErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
