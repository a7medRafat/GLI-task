import 'package:gli/Features/createtask/data/models/taskModel.dart';
import 'package:gli/core/firebase/firebase_store/firebase_firestore.dart';

abstract class HomeRemoteDataSource {
  Future<List<MapEntry<String, TaskModel>>> getTasks();

  Future<void> deleteTasks({required String id});

  Future<void> updateTasks(
      {required String id, required Map<String, dynamic> map});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  HomeRemoteDataSourceImpl({required this.firebaseStore});

  final FirebaseStore firebaseStore;

  @override
  Future<List<MapEntry<String, TaskModel>>> getTasks() async {
    return await firebaseStore.getTasks();
  }

  @override
  Future<void> deleteTasks({required String id}) async {
    return await firebaseStore.deleteTasks(id: id);
  }

  @override
  Future<void> updateTasks(
      {required String id, required Map<String, dynamic> map}) async {
    return await firebaseStore.updateTasks(id: id, map: map);
  }
}
