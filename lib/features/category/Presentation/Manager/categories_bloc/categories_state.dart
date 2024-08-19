import 'package:equatable/equatable.dart';

import '../../../data/model/categories_model.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoadingState extends CategoriesState {
  const CategoriesLoadingState();
}

final class CategoriesErrorState extends CategoriesState {
  final String errorMessage;

  const CategoriesErrorState({required this.errorMessage});
}

final class CategoriesSuccessState extends CategoriesState {
  final List<CategoriesModel> Categories;
  const CategoriesSuccessState(this.Categories);
}
