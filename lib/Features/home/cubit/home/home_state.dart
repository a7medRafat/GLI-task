part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetTasksLoadingState extends HomeState {}

class GetTasksErrorState extends HomeState {}

class GetTasksSuccessState extends HomeState {
  final List<MapEntry<String, TaskModel>> tasks;

  GetTasksSuccessState({required this.tasks});
}

class DeleteTasksLoadingState extends HomeState {}

class DeleteTasksErrorState extends HomeState {}

class DeleteTasksSuccessState extends HomeState {
  final String msg;

  DeleteTasksSuccessState({required this.msg});
}
