import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gli/Features/authentication/presentation/widgets/register/register_btn.dart';
import 'package:gli/config/style/app_colors.dart';
import 'package:gli/core/utiles/gContainer.dart';
import '../../../cubit/register_cubit/register_cubit.dart';
import '../../widgets/register/register_input_widget.dart';
import '../../widgets/register/register_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<RegisterCubit>(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: context.read<RegisterCubit>().registerKey,
            child: GContainer(
              color: AppColors.mainColor,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RegisterText(),
                  RegisterInputWidget(),
                  const RegisterBtn()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
