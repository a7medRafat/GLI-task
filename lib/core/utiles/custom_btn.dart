import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import '../../config/style/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Transform.rotate(
        angle: math.pi / 4,
        child: Container(
          width: 60.0.w,
          height: 60.0.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(23.0),
          ),
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: child,
          ),
        ),
      ),
    );
  }
}
