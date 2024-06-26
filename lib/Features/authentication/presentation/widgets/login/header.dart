import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gli/config/app_colors.dart';
import 'package:gli/config/style/app_fonts.dart';
import '../../../../../core/utiles/gContainer.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GContainer(
      color: AppColors.container,
      width: double.infinity,
      height: 186.h,
      child: Center(child: Text('GLI', style: AppFonts.headline1)),
    );
  }
}
