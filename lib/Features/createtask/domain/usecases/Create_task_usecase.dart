import 'package:dartz/dartz.dart';
import 'package:gli/Features/createtask/data/models/taskModel.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/create_task_repository.dart';

class CreateTaskUseCase {
  final CreateTaskRepository createTaskRepository;

  CreateTaskUseCase({required this.createTaskRepository});

  Future<Either<Failure, void>> call({required TaskModel taskModel}) async {
    return await createTaskRepository.createTask(taskModel: taskModel);
  }
}
