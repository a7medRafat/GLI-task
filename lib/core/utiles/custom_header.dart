import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/style/app_colors.dart';
import '../../config/style/app_fonts.dart';
import 'gContainer.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader(
      {super.key,
      required this.headerTitle,
      required this.actionIcon,
      required this.color});

  final String headerTitle;
  final IconData actionIcon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(CupertinoIcons.circle_filled, color: color, size: 12.sp),
                  SizedBox(width: 15.w),
                  Text(
                    headerTitle,
                    style: AppFonts.headline3.copyWith(
                      color: const Color(0xff0D062D),
                    ),
                  ),
                ],
              ),
              GContainer(
                padding: const EdgeInsets.all(5),
                color:color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
                child: Center(
                    child: Icon(actionIcon, color: color, size: 20.sp)),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          GContainer(
              width: MediaQuery.of(context).size.width,
              height: 1.h,
              color: color),
        ],
      ),
    );
  }
}
