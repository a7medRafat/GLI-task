import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gli/Features/createtask/data/models/taskModel.dart';
import '../../../Features/authentication/data/models/current_user_model.dart';
import '../../collections/collections.dart';

abstract class FirebaseStore {
  Future<void> addUserToFireStore({required CurrentUser currentUser});

  Future<DocumentReference<Map<String, dynamic>>> createTask(
      {required TaskModel taskModel});

  Future<CurrentUser> getCurrentUser({required String uid});

  Future<List<MapEntry<String, TaskModel>>> getTasks();

  Future<void> deleteTasks({required String id});

  Future<void> updateTasks(
      {required String id, required Map<String, dynamic> map});
}

class FirebaseStoreImpl implements FirebaseStore {
  @override
  Future<void> addUserToFireStore({required CurrentUser currentUser}) async {
    return await Collections.users
        .doc(currentUser.uid)
        .set(currentUser.toJson());
  }

  @override
  Future<CurrentUser> getCurrentUser({required String uid}) async {
    final result = await Collections.users.doc(uid).get();
    CurrentUser user = CurrentUser.fromJson(result.data()!);
    return user;
  }

  @override
  Future<DocumentReference<Map<String, dynamic>>> createTask(
      {required TaskModel taskModel}) async {
    return await Collections.myTasks.add(taskModel.toJson());
  }

  @override
  Future<List<MapEntry<String, TaskModel>>> getTasks() async {
    List<MapEntry<String, TaskModel>> tasks = [];
    Map<String, TaskModel> map = {};
    final response = await Collections.myTasks.get();
    for (var e in response.docs) {
      map.addAll({e.id: TaskModel.fromJson(e.data())});
      tasks = map.entries.toList();
    }
    return tasks;
  }

  @override
  Future<void> deleteTasks({required String id}) async {
    final res = await Collections.myTasks.doc(id).get();
    res.reference.delete();
  }

  @override
  Future<void> updateTasks(
      {required String id, required Map<String, dynamic> map}) async {
    return await Collections.myTasks.doc(id).update(map);
  }
}
