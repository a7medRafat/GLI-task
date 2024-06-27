import 'package:flutter/cupertino.dart';
import '../../../../../config/style/app_fonts.dart';

class TaskDescription extends StatelessWidget {
  const TaskDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(description, style: AppFonts.regular2),
    );
  }
}
