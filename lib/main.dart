import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'Features/authentication/data/models/current_user_model.dart';
import 'app/bloc_observer.dart';
import 'app/my_app.dart';
import 'core/local_storage/user_storage.dart';
import 'core/shared_preferances/cache_helper.dart';
import 'app/firebase_options.dart';
import 'app/injuctoin_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(CurrentUserAdapter());
  await UserStorage().init();
  await CacheHelper.init();
  await di.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MyApp());
}
