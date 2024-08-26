import 'package:Learn_U/features/category/data/model/course_details_model.dart';
import 'package:Learn_U/features/category/data/model/trainers_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../repo/Categories_Base_Repository.dart';

class CourseDetailsUsecase extends BaseUseCase<CourseDetailsModel, int> {
  final CategoriesBaseRepository baseRepository;

  CourseDetailsUsecase({required this.baseRepository});

  @override
  Future<Either<CourseDetailsModel, Failure>> call(int course_id) async {
    final result = await baseRepository.getcoursedetails(course_id);

    return result;
  }
}
