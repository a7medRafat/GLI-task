import 'package:bloc/bloc.dart';
import 'package:gli/Features/createtask/data/models/taskModel.dart';
import 'package:gli/Features/home/domain/usecases/delete_task_usecase.dart';
import 'package:gli/Features/home/domain/usecases/get_tasks_usecase.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getTasksUseCase, required this.deleteTasksUseCase})
      : super(HomeInitial());
  final GetTasksUseCase getTasksUseCase;
  final DeleteTasksUseCase deleteTasksUseCase;

  Future<void> getTasks() async {
    emit(GetTasksLoadingState());
    final failureOrSuccess = await getTasksUseCase.call();
    failureOrSuccess.fold((failure) => emit(GetTasksErrorState()), (success) {
      emit(GetTasksSuccessState(tasks: success));
    });
  }

  void deleteTasks({required String id}) async {
    emit(DeleteTasksLoadingState());
    final failureOrSuccess = await deleteTasksUseCase.call(id: id);

    failureOrSuccess.fold((failure) => emit(DeleteTasksErrorState()),
        (success) {
      getTasks();
      emit(DeleteTasksSuccessState(msg: 'deleted successfully'));
    });
  }


}
