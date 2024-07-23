import 'package:bloc/bloc.dart';
import '../../../../../core/utils/api_helper.dart';
import '../../../data/model/login_model.dart';
import '../../../domain/use_cases/login_uc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(const LoginLoadingState());
      final result = await loginUseCase
          .call(LoginModel(email: event.email, password: event.password));
      print(result);
      result.fold(
              (l) => emit(LoginSuccessState(
            loginAuthModelResponse: l,
          )), (r) {
        emit(LoginErrorState(errorMessage: DioHelper().getTypeOfFailure(r)));
      });
    });
  }
}
