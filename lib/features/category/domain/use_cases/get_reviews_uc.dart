import 'package:Learn_U/features/category/data/model/reviews_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../repo/Categories_Base_Repository.dart';

class GetReviewsUsecase extends BaseUseCase<List<ReviewsModel>, int> {
  final CategoriesBaseRepository baseRepository;

  GetReviewsUsecase({required this.baseRepository});

  @override
  Future<Either<List<ReviewsModel>, Failure>> call(int course_id) async {
    final result = await baseRepository.getReviews(course_id);

    return result;
  }
}
