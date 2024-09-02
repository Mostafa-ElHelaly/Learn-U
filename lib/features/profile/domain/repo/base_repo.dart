import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:Learn_U/features/auth/presentation/component/forget_password/forget_password_screen.dart';
import 'package:Learn_U/features/profile/data/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failure.dart';

abstract class ProfileBaseRepository {
  Future<Either<List<UserModel>, Failure>> getuser();
  Future<Either<void, Failure>> translate(BuildContext context);
}
