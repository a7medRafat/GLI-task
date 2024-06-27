import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gli/config/style/app_colors.dart';
import '../../../../core/utiles/custom_header.dart';
import '../widgets/new_task_btn.dart';
import '../widgets/new_task_inputs.dart';

class CreateTaskScreen extends StatelessWidget {
  CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
                headerTitle: 'Create New Task',
                actionIcon: Icons.clear,
                color: AppColors.newTaskColor),
            NewTaskInputs(),
            const NewTaskBtn()
          ],
        ),
      ),
    );
  }
}
