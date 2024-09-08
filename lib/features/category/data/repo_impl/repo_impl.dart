import 'package:Learn_U/core/error/failure.dart';
import 'package:Learn_U/features/category/data/model/categories_model.dart';
import 'package:Learn_U/features/category/data/model/course_details_model.dart';
import 'package:Learn_U/features/category/data/model/reviews_model.dart';
import 'package:Learn_U/features/category/data/model/trainers_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/api_helper.dart';
import '../../domain/repo/Categories_Base_Repository.dart';
import '../data_source/remotley_data_source.dart';

class CategoriesRepositoryImp extends CategoriesBaseRepository {
  final BaseCategoriesRemotelyDataSource baseRemotelyDataSource;

  CategoriesRepositoryImp({required this.baseRemotelyDataSource});

  @override
  Future<Either<List<CategoriesModel>, Failure>> getcategories() async {
    try {
      final result = await baseRemotelyDataSource.getCategories();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<List<TrainersModel>, Failure>> gettrainers() async {
    try {
      final result = await baseRemotelyDataSource.gettrainers();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<CourseDetailsModel, Failure>> getcoursedetails(
      int course_id) async {
    try {
      final result = await baseRemotelyDataSource.getcoursedetails(course_id);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<Unit, Failure>> SendReview(
      int course_id, int review_value, String review_message) async {
    try {
      final result = await baseRemotelyDataSource.SendReview(
          course_id, review_value, review_message);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<List<ReviewsModel>, Failure>> getReviews(int course_id) async {
    try {
      final result = await baseRemotelyDataSource.getReviews(course_id);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}
