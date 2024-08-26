import 'package:Learn_U/features/category/data/model/trainers_model.dart';
import 'package:equatable/equatable.dart';

abstract class TrainersState extends Equatable {
  const TrainersState();

  @override
  List<Object> get props => [];
}

final class TrainersInitial extends TrainersState {}

final class TrainersLoadingState extends TrainersState {
  const TrainersLoadingState();
}

final class TrainersErrorState extends TrainersState {
  final String errorMessage;

  const TrainersErrorState({required this.errorMessage});
}

final class TrainersSuccessState extends TrainersState {
  final List<TrainersModel> Trainers;
  const TrainersSuccessState(this.Trainers);
}
