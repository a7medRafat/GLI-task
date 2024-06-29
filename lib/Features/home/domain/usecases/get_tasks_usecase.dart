import 'package:dartz/dartz.dart';
import 'package:gli/Features/createtask/data/models/taskModel.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/home_repository.dart';

class GetTasksUseCase {
  final HomeRepository homeRepository;

  GetTasksUseCase({required this.homeRepository});

  Future<Either<Failure, List<MapEntry<String, TaskModel>>>> call() async {
    return await homeRepository.getTasks();
  }
}
