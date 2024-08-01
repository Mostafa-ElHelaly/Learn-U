import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:Learn_U/features/auth/domain/use_cases/otp_email_uc.dart';
import 'package:bloc/bloc.dart';

import '../../../../../core/utils/api_helper.dart';

import 'otp_email_event.dart';
import 'otp_email_state.dart';

class OtpEmailBloc extends Bloc<OtpEmailEvent, OtpEmailState> {
  OtpEmailUsecase OtpEmailUseCase;

  OtpEmailBloc({required this.OtpEmailUseCase}) : super(OtpEmailInitial()) {
    on<OtpEmailEvent>((event, emit) async {
      emit(const OtpEmailLoadingState());
      final result = await OtpEmailUseCase.call(LoginModel(
        email: event.email,
      ));
      result.fold(
          (l) => emit(OtpEmailSuccessState(OtpEmailModelResponse: l)),
          (r) => emit(OtpEmailErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
