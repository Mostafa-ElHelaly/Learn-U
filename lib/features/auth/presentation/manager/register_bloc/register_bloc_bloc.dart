import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:Learn_U/features/auth/presentation/manager/register_bloc/register_bloc_event.dart';
import 'package:Learn_U/features/auth/presentation/manager/register_bloc/register_bloc_state.dart';
import 'package:bloc/bloc.dart';

import '../../../../../core/utils/api_helper.dart';
import '../../../domain/use_cases/register_uc.dart';

class RegisterBloc extends Bloc<RegisterBlocEvent, RegisterState> {
  RegisterUseCase registerUseCase;

  RegisterBloc({required this.registerUseCase}) : super(RegisterInitial()) {
    on<RegisterBlocEvent>((event, emit) async {
      emit(const RegisterLoadingState());
      final result = await registerUseCase.call(LoginModel(
        firstname: event.first_name,
        middlename: event.middle_name,
        lastname: event.last_name,
        education: event.education,
        countryid: event.country_id,
        birthdate: event.birthdate,
        email: event.email,
        password: event.password,
        mobile: event.mobile,
      ));
      result.fold(
          (l) => emit(RegisterSuccessState(registerModelResponse: l)),
          (r) => emit(RegisterErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
