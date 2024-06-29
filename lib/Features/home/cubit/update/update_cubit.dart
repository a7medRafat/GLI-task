import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:gli/Features/home/cubit/home/home_cubit.dart';
import 'package:gli/Features/home/domain/usecases/updateTaskUsecase.dart';
import 'package:meta/meta.dart';
import '../../../../app/injuctoin_container.dart';
part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit({required this.updateTaskUseCase}) : super(UpdateInitial());
  final UpdateTaskUseCase updateTaskUseCase;

  final TextEditingController updateTitleCon = TextEditingController();
  final TextEditingController updateDescCon = TextEditingController();
  final GlobalKey<FormState> updateKey = GlobalKey<FormState>();

  void updateTask(
      {required String id, required Map<String, dynamic> map}) async {
    emit(UpdateTasksLoadingState());
    final failureOrSuccess = await updateTaskUseCase.call(id: id, map: map);
    failureOrSuccess.fold((failure) => emit(UpdateTasksErrorState()),
        (success) {
      sl<HomeCubit>().getTasks();
      emit(UpdateTasksSuccessState(msg: 'updated successfully'));
    });
  }
}
