import 'package:dartz/dartz.dart';
import 'package:gli/Features/createtask/data/models/taskModel.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<MapEntry<String, TaskModel>>>> getTasks();

  Future<Either<Failure, void>> deleteTasks({required String id});


  Future<Either<Failure, void>> updateTask({required String id , required Map<String, dynamic> map});
}
