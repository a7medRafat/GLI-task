import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gli/Features/createtask/data/models/taskModel.dart';
import 'package:gli/Features/createtask/domain/repositories/create_task_repository.dart';
import 'package:gli/core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/create_task_remote_data_source.dart';

class CreateTaskRepositoryImpl extends CreateTaskRepository {
  CreateTaskRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  final NetworkInfo networkInfo;
  final CreateTaskRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, void>> createTask(
      {required TaskModel taskModel}) async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await remoteDataSource.createTask(taskModel: taskModel);
        return right(remote);
      } on FirebaseAuthException catch (e) {
        return left(MyServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
