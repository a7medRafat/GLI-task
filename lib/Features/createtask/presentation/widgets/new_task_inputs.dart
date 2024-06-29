import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gli/Features/createtask/cubit/task_cubit.dart';

import '../../../../app/injuctoin_container.dart';
import '../../../../core/utiles/default_text_field.dart';

class NewTaskInputs extends StatelessWidget {
  const NewTaskInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: BlocListener<TaskCubit, TaskState>(
        listener: (context, state) {},
        child: Column(
          children: [
            DefaultField(
                controller: sl<TaskCubit>().titleController,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                hint: 'Title',
                filled: true,
                borderSide: false,
                isPassword: false,
                textInputType: TextInputType.text,
                borderRadius: BorderRadius.circular(5),
                validation: (value) {
                  if (value.isEmpty) {
                    return 'title required';
                  }
                }),
            SizedBox(height: 8.h),
            DefaultField(
                maxLines: 7,
                controller: sl<TaskCubit>().descriptionController,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                hint: 'Description',
                filled: true,
                borderSide: false,
                isPassword: false,
                textInputType: TextInputType.text,
                borderRadius: BorderRadius.circular(5),
                validation: (value) {
                  if (value.isEmpty) {
                    return 'Description required';
                  }
                }),
          ],
        ),
      ),
    );
  }
}
