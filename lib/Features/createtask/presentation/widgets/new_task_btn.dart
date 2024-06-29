import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gli/Features/createtask/cubit/task_cubit.dart';
import 'package:gli/Features/home/presentation/screens/Home_screen.dart';
import 'package:gli/config/style/app_colors.dart';
import 'package:gli/core/go/go.dart';
import 'package:gli/core/mysnackbar/mysnackbar.dart';
import 'package:gli/core/utiles/app_button.dart';
import 'package:gli/core/utiles/loading_widget.dart';
import '../../../../app/injuctoin_container.dart';

class NewTaskBtn extends StatelessWidget {
  const NewTaskBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocConsumer<TaskCubit, TaskState>(
        listener: (context, state) {
          if (state is CreateTaskSuccessState) {
            context.read<TaskCubit>()
              ..titleController.clear()
              ..descriptionController.clear();
            Go.goAndFinish(context, const HomeScreen());
          }
          if (state is CreateTaskErrorState) {
            MySnackBar.show(context, state.msg);
          }
        },
        builder: (context, state) {
          if (state is CreateTaskLoadingState) {
            return Loading(color: AppColors.newTaskColor);
          }
          return AppButton(
            text: 'Create Task',
            fun: () {
              if (sl<TaskCubit>().taskKey.currentState!.validate()) {
                sl<TaskCubit>().createTask();
              }
            },
            btnColor: AppColors.newTaskColor.withOpacity(0.8),
          );
        },
      ),
    );
  }
}
