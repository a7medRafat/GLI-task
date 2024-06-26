import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gli/config/Strings/app_strings.dart';
import 'package:gli/config/style/app_fonts.dart';

class LoginTextWidget extends StatelessWidget {
  const LoginTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Login Account', style: AppFonts.headline2),
          SizedBox(height: 16.h),
          Text(AppStrings.loginHint, style: AppFonts.regular1)
        ],
      ),
    );
  }
}
