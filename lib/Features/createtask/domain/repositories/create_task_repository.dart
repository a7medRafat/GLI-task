import 'package:dartz/dartz.dart';
import 'package:gli/Features/createtask/data/models/taskModel.dart';
import 'package:gli/core/errors/failures.dart';

abstract class CreateTaskRepository {
  Future<Either<Failure, void>> createTask({required TaskModel taskModel});
}
