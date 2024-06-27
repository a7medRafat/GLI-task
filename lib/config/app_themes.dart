import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gli/config/style/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      primaryColor: AppColors.primaryColor,
      useMaterial3: true,
      fontFamily: 'Poppins',
      iconTheme: IconThemeData(color: Colors.black, size: 20.sp));
}
