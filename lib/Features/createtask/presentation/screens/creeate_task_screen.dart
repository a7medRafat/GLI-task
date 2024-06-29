import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gli/Features/createtask/cubit/task_cubit.dart';
import 'package:gli/config/style/app_colors.dart';
import '../../../../core/utiles/custom_header.dart';
import '../widgets/new_task_btn.dart';
import '../widgets/new_task_inputs.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: context.read<TaskCubit>().taskKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(
                  headerTitle: 'Create New Task',
                  actionIcon: Icons.clear,
                  color: AppColors.newTaskColor,
                  actionFun: () => Navigator.pop(context), home: false),
              const NewTaskInputs(),
              const NewTaskBtn()
            ],
          ),
        ),
      ),
    );
  }
}
