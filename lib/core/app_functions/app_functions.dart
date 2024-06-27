import 'package:flutter/cupertino.dart';
import 'package:gli/Features/authentication/presentation/screens/login_screen/login_screen.dart';
import 'package:gli/Features/home/presentation/screens/Home_screen.dart';

import '../shared_preferances/cache_helper.dart';

abstract class AppFunctions {
  Widget startWidget();
}

class AppFunctionsImpl extends AppFunctions {
  @override
  Widget startWidget() {
    final Widget widget;
    final String? uid = CacheHelper.getData(key: 'uid');
    if (uid != null) {
      widget = const HomeScreen();
    } else {
      widget = const LoginScreen();
    }
    return widget;
  }
}
