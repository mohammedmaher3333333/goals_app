part of 'main_goals_cubit.dart';

class MainGoalsState {}

final class InitialState extends MainGoalsState {}

//// main state
final class GetDataSuccessState extends MainGoalsState {}

final class GetLoadingState extends MainGoalsState {}

final class GetErrorState extends MainGoalsState {}

// remove states
final class RemoveDataSuccessState extends MainGoalsState {}

final class RemoveDataLoadingState extends MainGoalsState {}

final class RemoveDataErrorState extends MainGoalsState {}

// update states
final class UpdateDataSuccessState extends MainGoalsState {}

final class UpdateDataLoadingState extends MainGoalsState {}

final class UpdateDataErrorState extends MainGoalsState {}

// insert states
final class InsertDataSuccessState extends MainGoalsState {}

final class InsertDataLoadingState extends MainGoalsState {}

final class InsertDataErrorState extends MainGoalsState {}
