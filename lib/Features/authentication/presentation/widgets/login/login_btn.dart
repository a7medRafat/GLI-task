import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gli/Features/authentication/cubit/login_cubit/login_cubit.dart';
import 'package:gli/Features/authentication/cubit/login_cubit/login_state.dart';
import 'package:gli/core/utiles/loading_widget.dart';
import '../../../../../app/injuctoin_container.dart';
import '../../../../../core/mysnackbar/mysnackbar.dart';
import '../../../../../core/utiles/app_button.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
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
          return const Center(child: Loading());
        }
        return Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          child: AppButton(
            text: 'Login',
            fun: () {
              if (context
                  .read<LoginCubit>()
                  .loginKey
                  .currentState!
                  .validate()) {
                context.read<LoginCubit>().userLogin();
              }
            },
          ),
        );
      },
    );
  }
}
