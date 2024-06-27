import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/user_login.dart';
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

  Future<void> signOut() async {
    await _auth.signOut().then((value) {
      emit(LogoutSuccessState());
    }).catchError((error) {
      print("Error signing out: $error");
    });
  }
}
