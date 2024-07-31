import 'package:equatable/equatable.dart';

import '../../../data/model/CountriesModel.dart';

abstract class GetCountriesState extends Equatable {
  const GetCountriesState();

  @override
  List<Object> get props => [];
}

class GetCountriesInitial extends GetCountriesState {}

class GetCountriesLoadingState extends GetCountriesState {
  const GetCountriesLoadingState();
}

class GetCountriesErrorMessageState extends GetCountriesState {
  final String errorMessage;

  const GetCountriesErrorMessageState({required this.errorMessage});
}

class GetCountriesSuccessMessageState extends GetCountriesState {
  final CountriesList successMessage;

  const GetCountriesSuccessMessageState({required this.successMessage});
}