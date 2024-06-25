import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../authentication/data/models/current_user_model.dart';
import '../../shared_preferances/cache_helper.dart';

abstract class StorageByFirebase {
  Future<void> addUserToFireStore({required CurrentUser currentUser});

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData();

  Future<CurrentUser> getCurrentUser({required String uid});
}

class StorageByFirebaseImpl implements StorageByFirebase {
  final users = FirebaseFirestore.instance.collection('users');

  @override
  Future<void> addUserToFireStore({required CurrentUser currentUser}) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .set(currentUser.toJson());
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(CacheHelper.getData(key: 'uid'))
        .get();
  }

  @override
  Future<CurrentUser> getCurrentUser({required String uid}) async {
    final result =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    CurrentUser user = CurrentUser.fromJson(result.data()!);
    return user;
  }
}
