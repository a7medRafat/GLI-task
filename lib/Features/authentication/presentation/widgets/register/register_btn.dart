import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gli/Features/authentication/cubit/register_cubit/register_cubit.dart';
import 'package:gli/Features/authentication/cubit/register_cubit/register_state.dart';
import 'package:gli/core/utiles/loading_widget.dart';
import '../../../../../core/go/go.dart';
import '../../../../../core/mysnackbar/mysnackbar.dart';
import '../../../../../core/utiles/app_button.dart';
import '../../screens/login_screen/login_screen.dart';

class RegisterBtn extends StatelessWidget {
  const RegisterBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          MySnackBar.show(context, state.successMsg);
          context.read<RegisterCubit>()
            ..passwordController.clear()
            ..emailController.clear()
            ..nameController.clear()
            ..phoneController.clear();
          Go.goAndFinish(context, const LoginScreen());
        }
        if (state is RegisterErrorState) {
          return MySnackBar.show(context, state.msg);
        }
      },
      builder: (context, state) {
        if (state is RegisterLoadingState) {
          return const Center(child: Loading());
        }
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: AppButton(
            text: 'Register',
            fun: () {
              if (context
                  .read<RegisterCubit>()
                  .registerKey
                  .currentState!
                  .validate()) {
                context.read<RegisterCubit>().userRegister();
              }
            },
          ),
        );
      },
    );
  }
}
