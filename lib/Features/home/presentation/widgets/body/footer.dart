import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../app/injuctoin_container.dart';
import '../../../../../core/local_storage/hive_keys.dart';
import '../../../../../core/local_storage/user_storage.dart';
import '../../../../../core/utiles/gContainer.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, required this.editFun});

  final Function() editFun;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
            radius: 12.sp,
            backgroundImage: NetworkImage(
                sl<UserData>().getData(id: HiveKeys.user)!.image!)),
        Row(
          children: [
            GContainer(
              function: editFun,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              color: Colors.transparent,
              child: Row(
                children: [
                  Icon(Icons.edit, size: 15.sp),
                  SizedBox(width: 5.w),
                  const Text('edit'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
