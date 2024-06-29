import 'package:flutter/material.dart';
import '../../../../../config/style/app_fonts.dart';

class DialogTitle extends StatelessWidget {
  const DialogTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Update Task', style: AppFonts.headline3),
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.clear))
      ],
    );
  }
}
