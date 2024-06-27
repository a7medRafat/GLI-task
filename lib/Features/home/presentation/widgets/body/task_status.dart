import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gli/config/style/app_colors.dart';

import '../../../../../config/style/app_fonts.dart';
import '../../../../../core/utiles/gContainer.dart';

class TaskStatus extends StatelessWidget {
  const TaskStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GContainer(
          color: AppColors.complete.withOpacity(0.1),
          padding: const EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(4),
          child: Text('completed',
              style: AppFonts.regular1.copyWith(color: AppColors.complete)),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
      ],
    );
  }
}
