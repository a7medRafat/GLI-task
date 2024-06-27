import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utiles/gContainer.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(radius: 12.sp, backgroundImage: NetworkImage(img)),
        Row(
          children: [
            GContainer(
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
            SizedBox(width: 5.w),
            GContainer(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              color: Colors.transparent,
              child: Row(
                children: [
                  Icon(Icons.done_outline_sharp, size: 15.sp),
                  SizedBox(width: 5.w),
                  const Text('done'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
