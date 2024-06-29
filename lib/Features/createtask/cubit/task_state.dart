part of 'task_cubit.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class CreateTaskLoadingState extends TaskState {}

class CreateTaskErrorState extends TaskState {
  final String msg;

  CreateTaskErrorState({required this.msg});
}
class CreateTaskSuccessState extends TaskState {}
