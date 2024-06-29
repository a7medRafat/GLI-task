import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gli/Features/createtask/data/models/taskModel.dart';
import 'package:gli/Features/home/domain/repositories/home_repository.dart';
import 'package:gli/core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  final NetworkInfo networkInfo;
  final HomeRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<MapEntry<String, TaskModel>>>> getTasks() async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await remoteDataSource.getTasks();
        return right(remote);
      } on FirebaseAuthException catch (e) {
        return left(MyServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTasks({required String id}) async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await remoteDataSource.deleteTasks(id: id);
        return right(remote);
      } on FirebaseAuthException catch (e) {
        return left(MyServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateTask(
      {required String id, required Map<String, dynamic> map}) async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await remoteDataSource.updateTasks(id: id, map: map);
        return right(remote);
      } on FirebaseAuthException catch (e) {
        return left(MyServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
