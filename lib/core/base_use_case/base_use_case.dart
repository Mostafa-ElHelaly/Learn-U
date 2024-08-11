import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:Learn_U/core/error/failure.dart';

abstract class BaseUseCase<T, Parameter> {
  Future<Either<T, Failure>> call(Parameter parameter);
}

abstract class SecondBaseUseCase<T> {
  Future<Either<T, Failure>> call();
}

class Noparamiter extends Equatable {
  const Noparamiter();

  @override
  List<Object?> get props => [];
}
