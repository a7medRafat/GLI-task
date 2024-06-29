import 'package:flutter/material.dart';
import 'package:gli/Features/createtask/presentation/screens/creeate_task_screen.dart';
import 'package:gli/Features/home/presentation/widgets/body/body.dart';
import 'package:gli/config/style/app_colors.dart';
import 'package:gli/core/go/go.dart';
import 'package:gli/core/local_storage/hive_keys.dart';
import 'package:gli/core/local_storage/user_storage.dart';
import '../../../../app/injuctoin_container.dart';
import '../../../../core/utiles/custom_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomHeader(
                headerTitle: sl<UserData>().getData(id: HiveKeys.user)!.name!,
                actionIcon: Icons.add,
                color: AppColors.headerColor,
                actionFun: () => Go.goTo(context, const CreateTaskScreen()),
                home: true),
            const Body()
          ],
        ),
      ),
    );
  }
}
