import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gli/Features/authentication/cubit/register_cubit/register_state.dart';
import 'package:gli/Features/authentication/presentation/screens/login_screen/login_screen.dart';
import 'package:gli/Features/authentication/presentation/widgets/register/register_btn.dart';
import 'package:gli/config/app_colors.dart';
import 'package:gli/core/go/go.dart';
import 'package:gli/core/utiles/gContainer.dart';
import '../../../../../app/injuctoin_container.dart';
import '../../../../../core/mysnackbar/mysnackbar.dart';
import '../../../../../core/utiles/loading_widget.dart';
import '../../../cubit/register_cubit/register_cubit.dart';
import '../../widgets/register/register_input_widget.dart';
import '../../widgets/register/register_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: sl<RegisterCubit>().registerKey,
        child: SingleChildScrollView(
          child: GContainer(
            color: AppColors.mainColor,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RegisterText(),
                RegisterInputWidget(),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccessState) {
                      MySnackBar.show(context, state.successMsg);
                      sl<RegisterCubit>()
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
                      return const LoadingWidget();
                    }
                    return RegisterBtn(function: () {
                      if (sl<RegisterCubit>()
                          .registerKey
                          .currentState!
                          .validate()) {
                        sl<RegisterCubit>().userRegister();
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
