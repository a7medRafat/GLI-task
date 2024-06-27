import 'package:flutter/cupertino.dart';
import 'package:gli/config/style/app_colors.dart';
import 'package:gli/core/utiles/app_button.dart';

class NewTaskBtn extends StatelessWidget {

  const NewTaskBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AppButton(
        text: 'Create Task',
        fun: () {},
        btnColor: AppColors.newTaskColor.withOpacity(0.8),
      ),
    );
  }
}
