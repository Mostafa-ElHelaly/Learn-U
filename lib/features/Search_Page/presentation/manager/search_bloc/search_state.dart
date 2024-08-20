import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoadingState extends SearchState {
  const SearchLoadingState();
}

final class SearchErrorState extends SearchState {
  final String errorMessage;

  const SearchErrorState({required this.errorMessage});
}

final class SearchSuccessState extends SearchState {
  final List<SearchModel> SearchList;
  const SearchSuccessState(this.SearchList);
}
