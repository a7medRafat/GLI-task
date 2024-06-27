import 'package:flutter/material.dart';
import 'package:gli/config/style/app_fonts.dart';
import 'package:gli/config/style/icons_broken.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MySnackBar {
  static void show (context, String msg) => showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          textStyle: AppFonts.regular1,
          icon: const Icon(IconBroken.Info_Circle, color: Colors.white),
          message: msg,
          backgroundColor: Colors.white,
        ),
      );
}
