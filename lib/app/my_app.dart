import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gli/authentication/cubit/login_cubit/login_cubit.dart';
import 'package:gli/authentication/presentation/screens/login_screen/login_screen.dart';
import '../authentication/cubit/register_cubit/register_cubit.dart';
import '../style/app_theme/app_themes.dart';
import 'injuctoin_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<LoginCubit>()),
        BlocProvider(create: (context) => sl<RegisterCubit>()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          home: LoginScreen()),
    );
  }
}
