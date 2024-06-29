import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gli/Features/authentication/cubit/login_cubit/login_cubit.dart';
import 'package:gli/Features/authentication/cubit/register_cubit/register_cubit.dart';
import 'package:gli/Features/home/cubit/home/home_cubit.dart';
import 'package:gli/Features/home/cubit/update/update_cubit.dart';
import '../Features/createtask/cubit/task_cubit.dart';
import 'injuctoin_container.dart';

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<LoginCubit>()),
        BlocProvider(create: (context) => sl<RegisterCubit>()),
        BlocProvider(create: (context) => sl<TaskCubit>()),
        BlocProvider(create: (context) =>  sl<HomeCubit>()..getTasks()),
        BlocProvider(create: (context) =>  sl<UpdateCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: startWidget,
        ),
      ),
    );
  }
}
