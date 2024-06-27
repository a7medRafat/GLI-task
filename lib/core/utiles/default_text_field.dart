import 'package:flutter/material.dart';
import 'package:gli/config/style/app_colors.dart';

import '../../config/style/app_fonts.dart';

class DefaultField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final String? suffixText;
  final Widget? suffixIconBtn;
  final Widget? suffixTextBtn;
  final Color? suffixIconColor;
  final bool isPassword;
  final TextInputType textInputType;
  final Function()? suffixPressed;
  final validation;
  final Function(String)? onChanged;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  bool borderSide;
  bool? filled = false;
  int? maxLines;

  DefaultField({
    super.key,
    required this.controller,
    required this.hint,
    required this.isPassword,
    required this.textInputType,
    required this.validation,
    this.suffixPressed,
    this.suffixIcon,
    this.suffixText,
    this.suffixIconColor,
    this.prefixIcon,
    this.suffixIconBtn,
    this.padding,
    this.suffixTextBtn,
    this.onChanged,
    required this.borderSide,
    this.filled,
    this.borderRadius,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      onChanged: onChanged,
      keyboardType: textInputType,
      validator: validation,
      obscureText: isPassword,
      style: AppFonts.regular1,
      controller: controller,
      decoration: InputDecoration(
        contentPadding:
            padding ?? const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
        border: OutlineInputBorder(
            borderSide: borderSide ? BorderSide(width: 0.7, color: AppColors.bodyText3) : BorderSide.none,
            borderRadius: borderRadius!),
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
            onPressed: suffixPressed,
            icon: Icon(suffixIcon, color: suffixIconColor)),
        suffixText: suffixText,
        hintText: hint,
        hintStyle: AppFonts.regular1,
        filled: filled,
        fillColor: Colors.white,
      ),
    );
  }
}
