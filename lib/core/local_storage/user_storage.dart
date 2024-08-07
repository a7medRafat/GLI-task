import 'package:hive/hive.dart';

import '../../authentication/data/models/current_user_model.dart';
import 'hive_keys.dart';
import 'local_storage.dart';

class UserStorage implements LocalStorage<CurrentUser> {
  static Box<CurrentUser>? _box;

  @override
  Future<void> init() async {
    _box = await Hive.openBox(HiveKeys.currentUser);
  }

  @override
  CurrentUser? getData({required String id}) => _box!.get(id);

  @override
  Future<void> saveData({required String id, required CurrentUser data}) async {
    await _box!.put(id, data);
    await _box!.flush();
  }

  @override
  Future<void> deleteData({required String id}) async {
    await _box!.delete(id);
  }
}
