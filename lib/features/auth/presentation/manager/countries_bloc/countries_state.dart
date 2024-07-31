import 'package:Learn_U/features/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/countries_model.dart';

abstract class CountriesState extends Equatable {
  const CountriesState();

  @override
  List<Object> get props => [];
}

final class CountriesInitial extends CountriesState {}

final class CountriesLoadingState extends CountriesState {
  const CountriesLoadingState();
}

final class CountriesErrorState extends CountriesState {
  final String errorMessage;

  const CountriesErrorState({required this.errorMessage});
}

final class CountriesSuccessState extends CountriesState {
  final List<CountriesModel> countries;
  const CountriesSuccessState(this.countries);
}
