import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:Learn_U/features/auth/presentation/manager/register_bloc/register_bloc_event.dart';
import 'package:Learn_U/features/auth/presentation/manager/register_bloc/register_bloc_state.dart';
import 'package:bloc/bloc.dart';

import '../../../../../core/utils/api_helper.dart';
import '../../../domain/use_cases/register_use_case.dart';

class RegisterBloc extends Bloc<RegisterBlocEvent, RegisterState> {
  RegisterUseCase registerUseCase;

  RegisterBloc({required this.registerUseCase}) : super(RegisterInitial()) {
    on<RegisterBlocEvent>((event, emit) async {
      emit(const RegisterLoadingState());
      final result = await registerUseCase.call(RegisterModel(
        country_id: event.country_id,
        first_name: event.first_name,
        middle_name: event.middle_name,
        last_name: event.last_name,
        birthdate: event.birthdate,
        education: event.education,
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
