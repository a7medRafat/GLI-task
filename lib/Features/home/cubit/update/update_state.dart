part of 'update_cubit.dart';

@immutable
abstract class UpdateState {}

class UpdateInitial extends UpdateState {}

class UpdateTasksLoadingState extends UpdateState {}

class UpdateTasksErrorState extends UpdateState {}

class UpdateTasksSuccessState extends UpdateState {
  final String msg;

  UpdateTasksSuccessState({required this.msg});
}
