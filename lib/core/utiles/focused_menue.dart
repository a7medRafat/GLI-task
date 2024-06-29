import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:gli/config/style/app_colors.dart';

class FocusedMenu extends StatelessWidget {
  const FocusedMenu({super.key, required this.listItem});

  final List<FocusedMenuItem> listItem;

  @override
  Widget build(BuildContext context) {
    return FocusedMenuHolder(
      onPressed: () {},
      menuWidth: MediaQuery.of(context).size.width * 0.50,
      menuBoxDecoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: const BorderRadius.all(Radius.circular(15.0))),
      duration: const Duration(milliseconds: 0),
      animateMenuItems: true,
      openWithTap: true,
      menuOffset: 5,
      blurSize: 1.0,
      bottomOffsetHeight: 100.h,
      menuItemExtent: 45,
      menuItems: listItem,
      child: const Icon(Icons.more_horiz),
    );
  }
}
