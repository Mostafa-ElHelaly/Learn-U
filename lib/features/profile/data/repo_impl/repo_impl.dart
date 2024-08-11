import 'package:Learn_U/core/base_use_case/base_use_case.dart';
import 'package:Learn_U/core/error/failure.dart';
import 'package:Learn_U/features/auth/data/model/countries_model.dart';
import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:Learn_U/features/profile/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/api_helper.dart';
import '../../domain/repo/base_repo.dart';
import '../data_source/remotly_data_source.dart';

class ProfileRepositoryImp extends ProfileBaseRepository {
  final BaseProfileRemotelyDataSource baseRemotelyDataSource;

  ProfileRepositoryImp({required this.baseRemotelyDataSource});

  @override
  Future<Either<List<UserModel>, Failure>> getuser() async {
    try {
      final result = await baseRemotelyDataSource.getuserdata();
      print('result :' + result.toString());
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}
