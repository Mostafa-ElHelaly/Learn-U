import 'package:Learn_U/features/category/data/model/reviews_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../repo/Categories_Base_Repository.dart';

class SendReviewUsecase extends BaseUseCase<Unit, SendReviewModel> {
  final CategoriesBaseRepository baseRepository;

  SendReviewUsecase({required this.baseRepository});

  @override
  Future<Either<Unit, Failure>> call(SendReviewModel parameter) async {
    final result = await baseRepository.SendReview(parameter.course_id!,
        parameter.review_value!, parameter.review_message!);

    return result;
  }
}

class SendReviewModel {
  int? course_id;
  double? review_value;
  String? review_message;

  SendReviewModel({
    this.course_id,
    this.review_value,
    this.review_message,
  });
}
