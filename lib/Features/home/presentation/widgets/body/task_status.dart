import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focused_menu/modals.dart';
import 'package:gli/Features/home/cubit/home/home_cubit.dart';
import 'package:gli/Features/home/cubit/update/update_cubit.dart';
import 'package:gli/config/style/app_colors.dart';

import '../../../../../config/style/app_fonts.dart';
import '../../../../../config/style/icons_broken.dart';
import '../../../../../core/utiles/focused_menue.dart';
import '../../../../../core/utiles/gContainer.dart';

class TaskStatus extends StatelessWidget {
  const TaskStatus({super.key, required this.taskId, required this.status, required this.color});

  final String taskId;
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GContainer(
          color: color.withOpacity(0.1),
          padding: const EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(4),
          child: Text(status,
              style: AppFonts.regular1.copyWith(color: color)),
        ),
        FocusedMenu(
          listItem: [
            FocusedMenuItem(
              title: Text('Completed', style: AppFonts.bodyText3),
              trailingIcon: Icon(CupertinoIcons.check_mark, size: 20.sp),
              backgroundColor: Colors.white,
              onPressed: () {
                context
                    .read<UpdateCubit>()
                    .updateTask(id: taskId, map: {'status': 'completed'});
              },
            ),
            FocusedMenuItem(
              title: Text(
                'Delete',
                style: AppFonts.bodyText3.copyWith(color: AppColors.mainColor),
              ),
              trailingIcon:
                  Icon(IconBroken.Delete, color: Colors.white, size: 20.sp),
              backgroundColor: Colors.redAccent,
              onPressed: () {
                context.read<HomeCubit>().deleteTasks(id: taskId);
              },
            ),
          ],
        ),
      ],
    );
  }
}
