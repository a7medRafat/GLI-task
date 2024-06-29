// ignore_for_file: void_checks
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gli/Features/authentication/presentation/widgets/login/header.dart';
import 'package:gli/Features/authentication/presentation/widgets/login/login_btn.dart';
import '../../../cubit/login_cubit/login_cubit.dart';
import '../../widgets/login/login_input_widget.dart';
import '../../widgets/login/login_text_widget.dart';
import '../../widgets/login/register_now_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: context
              .read<LoginCubit>()
              .loginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginHeader(),
              const LoginTextWidget(),
              LoginInputWidget(),
              const LoginBtn(),
              const RegisterNowWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
