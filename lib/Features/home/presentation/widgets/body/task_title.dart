import 'package:flutter/cupertino.dart';

import '../../../../../config/style/app_fonts.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppFonts.headline3);
  }
}
