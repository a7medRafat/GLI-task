import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gli/Features/authentication/cubit/login_cubit/login_cubit.dart';
import 'package:gli/Features/authentication/cubit/login_cubit/login_state.dart';
import '../../../../../app/injuctoin_container.dart';
import '../../../../../config/Strings/app_strings.dart';
import '../../../../../config/style/icons_broken.dart';
import '../../../../../core/utiles/default_text_field.dart';

class LoginInputWidget extends StatefulWidget {
  LoginInputWidget({super.key});

  bool isPassword = false;

  @override
  State<LoginInputWidget> createState() => _LoginInputWidgetState();
}

class _LoginInputWidgetState extends State<LoginInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {},
        child: Column(
          children: [
            DefaultField(
              controller: sl<LoginCubit>().emailController,
              hint: AppStrings.email,
              prefixIcon: const Icon(IconBroken.Message),
              isPassword: false,
              borderSide: true,
              borderRadius: BorderRadius.circular(20),
              textInputType: TextInputType.emailAddress,
              validation: (value) {
                if (value.isEmpty) {
                  return AppStrings.validateEmail;
                }
                RegExp regex = RegExp(AppStrings.emailPattern);
                if (!regex.hasMatch(value)) {
                  return AppStrings.emailReturn;
                }
              },
            ),
            SizedBox(height: 10.h),
            DefaultField(
              controller: sl<LoginCubit>().passwordController,
              hint: AppStrings.password,
              prefixIcon: const Icon(IconBroken.Lock),
              borderRadius: BorderRadius.circular(20),
              borderSide: true,
              suffixIcon: widget.isPassword ? IconBroken.Show : IconBroken.Hide,
              suffixPressed: () {
                setState(() {
                  widget.isPassword = !widget.isPassword;
                });
              },
              isPassword: widget.isPassword ? true : false,
              textInputType: TextInputType.emailAddress,
              validation: (value) {
                if (value.isEmpty) {
                  return AppStrings.validatePassword;
                }
                RegExp regex = RegExp(AppStrings.passwordPattern);
                if (!regex.hasMatch(value)) {
                  return AppStrings.passwordReturn;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
