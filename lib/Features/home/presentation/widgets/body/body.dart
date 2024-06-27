import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gli/Features/home/presentation/widgets/body/footer.dart';
import 'package:gli/Features/home/presentation/widgets/body/task_description.dart';
import 'package:gli/Features/home/presentation/widgets/body/task_status.dart';
import 'package:gli/Features/home/presentation/widgets/body/task_title.dart';
import 'package:gli/config/style/app_colors.dart';
import 'package:gli/core/local_storage/hive_keys.dart';
import 'package:gli/core/local_storage/user_storage.dart';
import 'package:gli/core/utiles/gContainer.dart';

import '../../../../../app/injuctoin_container.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
          primary: false,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => GContainer(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                padding: const EdgeInsets.all(20),
                borderRadius: BorderRadius.circular(16),
                height: 220.h,
                width: MediaQuery.of(context).size.width,
                color: AppColors.mainColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TaskStatus(),
                    SizedBox(height: 5.h),
                    const TaskTitle(title: 'Design System'),
                    SizedBox(height: 8.h),
                    const TaskDescription(
                        description:
                            'It just needs to adapt the UI from what you did before '),
                    Footer(
                        img: sl<UserData>().getData(id: HiveKeys.user)!.image!)
                  ],
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(height: 5.h),
          itemCount: 5),
    );
  }
}
