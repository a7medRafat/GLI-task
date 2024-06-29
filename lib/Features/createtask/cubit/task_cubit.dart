import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:gli/Features/createtask/data/models/taskModel.dart';
import 'package:gli/Features/createtask/domain/usecases/Create_task_usecase.dart';
import 'package:gli/Features/home/cubit/home/home_cubit.dart';
import 'package:meta/meta.dart';

import '../../../app/injuctoin_container.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit({required this.createTaskUseCase}) : super(TaskInitial());
  final CreateTaskUseCase createTaskUseCase;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> taskKey = GlobalKey<FormState>();

  void createTask() async {
    emit(CreateTaskLoadingState());
    TaskModel taskModel = TaskModel(
        title: titleController.text,
        description: descriptionController.text,
        status: 'new');
    final failureOrSuccess = await createTaskUseCase.call(taskModel: taskModel);
    failureOrSuccess.fold(
        (failure) => emit(CreateTaskErrorState(msg: failure.getMessage())),
        (success) async {
      await sl<HomeCubit>().getTasks();
      emit(CreateTaskSuccessState());
    });
  }
}
