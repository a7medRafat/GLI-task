import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gli/Features/authentication/cubit/register_cubit/register_cubit.dart';
import 'package:gli/Features/authentication/cubit/register_cubit/register_state.dart';
import '../../../../../app/injuctoin_container.dart';
import '../../../../../config/Strings/app_strings.dart';
import '../../../../../config/style/icons_broken.dart';
import '../../../../../core/utiles/default_text_field.dart';

class RegisterInputWidget extends StatefulWidget {
  RegisterInputWidget({super.key});

  bool isPassword = true;

  @override
  State<RegisterInputWidget> createState() => _RegisterInputWidgetState();
}

class _RegisterInputWidgetState extends State<RegisterInputWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DefaultField(
              borderRadius: BorderRadius.circular(20),
              controller: sl<RegisterCubit>().nameController,
              hint: AppStrings.name,
              prefixIcon: const Icon(IconBroken.User),
              isPassword: false,
              textInputType: TextInputType.name,
              validation: (value) {
                if (value.isEmpty) {
                  return AppStrings.validateName;
                }
              },
            ),
            SizedBox(height: 10.h),
            DefaultField(
              borderRadius: BorderRadius.circular(20),
              controller: sl<RegisterCubit>().emailController,
              hint: 'email',
              prefixIcon: const Icon(IconBroken.Message),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              validation: (value) {
                if (value.isEmpty) {
                  return AppStrings.validateEmail;
                }
                AppStrings.emailPattern;
                RegExp regex = RegExp(AppStrings.emailPattern);
                if (!regex.hasMatch(value)) {
                  return AppStrings.emailReturn;
                }
              },
            ),
            SizedBox(height: 10.h),
            DefaultField(
              borderRadius: BorderRadius.circular(20),
              controller: sl<RegisterCubit>().passwordController,
              hint: AppStrings.password,
              isPassword: widget.isPassword,
              prefixIcon: const Icon(IconBroken.Password),
              suffixPressed: () {
                setState(() {
                  widget.isPassword = !widget.isPassword;
                });
              },
              suffixIcon: widget.isPassword ? IconBroken.Show : IconBroken.Hide,
              textInputType: TextInputType.visiblePassword,
              validation: (value) {
                if (value.isEmpty) {
                  return AppStrings.validatePassword;
                }
                AppStrings.passwordPattern;
                RegExp regex = RegExp(AppStrings.passwordPattern);
                if (!regex.hasMatch(value)) {
                  return AppStrings.passwordReturn;
                }
              },
            ),
            SizedBox(height: 10.h),
            DefaultField(
              borderRadius: BorderRadius.circular(20),
              controller: sl<RegisterCubit>().phoneController,
              hint: AppStrings.phone,
              prefixIcon: const Icon(IconBroken.Call),
              isPassword: false,
              textInputType: TextInputType.phone,
              validation: (value) {
                if (value.isEmpty) {
                  return AppStrings.validatePhone;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
