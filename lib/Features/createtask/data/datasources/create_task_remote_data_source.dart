import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gli/core/firebase/firebase_store/firebase_firestore.dart';

import '../models/taskModel.dart';

abstract class CreateTaskRemoteDataSource {
  Future<DocumentReference<Map<String, dynamic>>> createTask(
      {required TaskModel taskModel});
}

class CreateTaskRemoteDataSourceImpl extends CreateTaskRemoteDataSource {
  CreateTaskRemoteDataSourceImpl({required this.firebaseStore});

  final FirebaseStore firebaseStore;

  @override
  Future<DocumentReference<Map<String, dynamic>>> createTask(
      {required TaskModel taskModel}) async {
    return await firebaseStore.createTask(taskModel: taskModel);
  }
}
