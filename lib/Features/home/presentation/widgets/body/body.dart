import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gli/Features/home/cubit/home/home_cubit.dart';
import 'package:gli/Features/home/presentation/widgets/body/footer.dart';
import 'package:gli/Features/home/presentation/widgets/body/task_description.dart';
import 'package:gli/Features/home/presentation/widgets/body/task_status.dart';
import 'package:gli/Features/home/presentation/widgets/body/task_title.dart';
import 'package:gli/Features/home/presentation/widgets/update/dialog.dart';
import 'package:gli/config/style/app_colors.dart';
import 'package:gli/core/utiles/gContainer.dart';
import 'package:gli/core/utiles/loading_widget.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is GetTasksSuccessState,
        builder: (context, state) {
          if (state is GetTasksLoadingState) {
            return Center(child: Loading(color: AppColors.headerColor));
          }
          if (state is GetTasksErrorState) {
            return const Text('some thing went wrong');
          }
          if (state is GetTasksSuccessState) {
            if(state.tasks.isEmpty){
              return const Text('No Tasks yet');
            }
            return ListView.separated(
                primary: false,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => GContainer(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      padding: const EdgeInsets.all(20),
                      borderRadius: BorderRadius.circular(16),
                      height: 220.h,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.mainColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TaskStatus(
                              taskId: state.tasks[index].key,
                              status: state.tasks[index].value.status!,
                              color: state.tasks[index].value.status == 'new'
                                  ? AppColors.newTask
                                  : AppColors.complete),
                          SizedBox(height: 5.h),
                          TaskTitle(title: state.tasks[index].value.title!),
                          SizedBox(height: 8.h),
                          TaskDescription(
                              description:
                                  state.tasks[index].value.description!),
                          Footer(
                            editFun: () => myDialog(
                                context,
                                state.tasks[index].value,
                                state.tasks[index].key),
                          )
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(height: 5.h),
                itemCount: state.tasks.length);
          }
          return Center(child: Loading(color: AppColors.headerColor));
        },
      ),
    );
  }
}
