import 'package:flutter/material.dart';
import 'package:gli/config/style/app_fonts.dart';
import 'package:gli/core/utiles/gContainer.dart';

import '../../config/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function() fun;
  final Color? btnColor;

  const AppButton(
      {super.key, required this.text, required this.fun, this.btnColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GContainer(
      function: fun,
      height: size.width * 0.15,
      width: size.width,
      color: btnColor ?? AppColors.rectangle4,
      borderRadius: BorderRadius.circular(20),
      child: Center(child: Text(text, style: AppFonts.bodyText2)),
    );
  }
}
