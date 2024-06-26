import 'package:flutter/material.dart';
import 'package:gli/config/style/app_fonts.dart';

import '../../../../../config/app_colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 0.4,
              color: AppColors.headLine2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('OR', style: AppFonts.bodyText3),
          ),
          Expanded(
            child: Container(
              height: 0.4,
              color: AppColors.headLine2,
            ),
          ),
        ],
      ),
    );
  }
}
