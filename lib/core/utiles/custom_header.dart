import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gli/Features/authentication/cubit/login_cubit/login_cubit.dart';
import 'package:gli/Features/authentication/cubit/login_cubit/login_state.dart';
import 'package:gli/Features/authentication/presentation/screens/login_screen/login_screen.dart';
import 'package:gli/core/go/go.dart';
import '../../config/style/app_fonts.dart';
import '../../config/style/icons_broken.dart';
import 'gContainer.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader(
      {super.key,
      required this.headerTitle,
      required this.actionIcon,
      required this.actionFun,
      required this.color,
      required this.home});

  final String headerTitle;
  final IconData actionIcon;
  final Function() actionFun;
  final Color color;
  final bool home;

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
              Row(
                children: [
                  GContainer(
                    function: actionFun,
                    padding: const EdgeInsets.all(5),
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                        child: Icon(actionIcon, color: color, size: 20.sp)),
                  ),
                  SizedBox(width: 5.w),
                  if (home == true)
                    BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return GContainer(
                          function: () => context.read<LoginCubit>().signOut(context),
                          padding: const EdgeInsets.all(5),
                          color: color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                          child: Center(
                              child: Icon(IconBroken.Logout,
                                  color: color, size: 20.sp)),
                        );
                      },
                    ),
                ],
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
