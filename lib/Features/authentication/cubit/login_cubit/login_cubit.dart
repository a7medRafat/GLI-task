import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gli/core/local_storage/hive_keys.dart';
import 'package:gli/core/local_storage/user_storage.dart';
import 'package:gli/core/shared_preferances/cache_helper.dart';
import '../../../../core/go/go.dart';
import '../../domain/usecases/user_login.dart';
import '../../presentation/screens/login_screen/login_screen.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.userLoginUseCase}) : super(LoginInitial());
  final UserLoginUseCase userLoginUseCase;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void userLogin() async {
    emit(LoginLoadingState());
    final failureOrSuccess = await userLoginUseCase.call(
        emailController.text, passwordController.text);
    failureOrSuccess
        .fold((failure) => emit(LoginErrorState(msg: failure.getMessage())),
            (success) async {
      emit(LoginSuccessState(
          successMsg: 'login successfully', uid: success.user!.uid));
    });
  }

  Future<void> signOut(context) async {
    await _auth.signOut().then((value) {
      CacheHelper.removeData(key: 'uid');
      UserData().deleteData(id: HiveKeys.user);
      Go.goAndFinish(context, const LoginScreen());
      emit(LogoutSuccessState());
    }).catchError((error) {
      print("Error signing out: $error");
    });
  }
}
