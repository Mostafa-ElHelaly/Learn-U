import 'package:Learn_U/features/category/Presentation/Manager/send_review_bloc/send_review_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/send_review_bloc/send_review_state.dart';
import 'package:Learn_U/features/category/domain/use_cases/send_review_uc.dart';
import 'package:bloc/bloc.dart';

import '../../../../../../core/utils/api_helper.dart';

class SendReviewsBloc extends Bloc<SendallSendReviewEvent, SendReviewsState> {
  SendReviewUsecase sendreviewsUseCase;

  SendReviewsBloc({required this.sendreviewsUseCase})
      : super(SendReviewsInitial()) {
    on<SendallSendReviewEvent>((event, emit) async {
      emit(const SendReviewsLoadingState());
      final result = await sendreviewsUseCase.call(
        SendReviewModel(
          course_id: event.course_id,
          review_value: event.review_value,
          review_message: event.review_message,
        ),
      );
      result.fold(
          (l) => emit(SendReviewsSuccessState(l)),
          (r) => emit(SendReviewsErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
