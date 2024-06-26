import 'package:cloud_firestore/cloud_firestore.dart';

class Collections {
  CollectionReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection('users');
}
