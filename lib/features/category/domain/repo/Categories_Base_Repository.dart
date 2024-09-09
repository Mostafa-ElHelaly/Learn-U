import 'package:Learn_U/features/category/data/model/categories_model.dart';
import 'package:Learn_U/features/category/data/model/course_details_model.dart';
import 'package:Learn_U/features/category/data/model/reviews_model.dart';
import 'package:Learn_U/features/category/data/model/trainers_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

abstract class CategoriesBaseRepository {
  Future<Either<List<CategoriesModel>, Failure>> getcategories();
  Future<Either<List<TrainersModel>, Failure>> gettrainers();
  Future<Either<CourseDetailsModel, Failure>> getcoursedetails(int course_id);
  Future<Either<Unit, Failure>> SendReview(
      int course_id, double review_value, String review_message);
  Future<Either<List<ReviewsModel>, Failure>> getReviews(int course_id);
}
