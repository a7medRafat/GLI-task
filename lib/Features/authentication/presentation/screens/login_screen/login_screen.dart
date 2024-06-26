// ignore_for_file: void_checks
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gli/Features/authentication/cubit/login_cubit/login_state.dart';
import 'package:gli/Features/authentication/presentation/widgets/login/header.dart';
import 'package:gli/Features/authentication/presentation/widgets/login/login_btn.dart';
import 'package:gli/core/mysnackbar/mysnackbar.dart';
import 'package:gli/core/utiles/loading_widget.dart';
import '../../../../../app/injuctoin_container.dart';
import '../../../cubit/login_cubit/login_cubit.dart';
import '../../widgets/login/face_and_google_widget.dart';
import '../../widgets/login/login_input_widget.dart';
import '../../widgets/login/login_text_widget.dart';
import '../../widgets/login/or_divider_widget.dart';
import '../../widgets/login/register_now_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: sl<LoginCubit>().loginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginHeader(),
              const LoginTextWidget(),
              LoginInputWidget(),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    MySnackBar.show(context, state.successMsg);
                    sl<LoginCubit>()
                      ..emailController.clear()
                      ..passwordController.clear();
                  }
                  if (state is LoginErrorState) {
                    return MySnackBar.show(context, state.msg);
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoadingState) {
                    return const LoadingWidget();
                  }
                  return LoginBtn(function: () {
                    if (sl<LoginCubit>().loginKey.currentState!.validate()) {
                      sl<LoginCubit>().userLogin();
                    }
                  });
                },
              ),
              const RegisterNowWidget(),
              const OrDivider(),
              SizedBox(height: 15.h),
              const FaceAndGoogleWidget()
            ],
          ),
        ),
      ),
    );
  }
}
