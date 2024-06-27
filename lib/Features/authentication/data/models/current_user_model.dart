import 'package:hive/hive.dart';

part 'current_user_model.g.dart';

@HiveType(typeId: 0)
class CurrentUser extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? password;
  @HiveField(3)
  String? phone;
  @HiveField(4)
  String? uid;
  @HiveField(5)
  String? image;

  CurrentUser(
      {required this.name,
      required this.email,
      this.password,
      required this.phone,
      required this.uid,
      required this.image});

  CurrentUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    email = json['password'];
    phone = json['phone'];
    uid = json['uid'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'uid': uid,
      'image': image
    };
  }
}
