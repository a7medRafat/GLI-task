import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared_preferances/cache_helper.dart';

class Collections {
  static CollectionReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection('users');

  static CollectionReference<Map<String, dynamic>> tasks =
      FirebaseFirestore.instance.collection('tasks');

  static CollectionReference<Map<String, dynamic>> myTasks = FirebaseFirestore
      .instance
      .collection('tasks')
      .doc(CacheHelper.getData(key: 'uid'))
      .collection('myTasks');
}
