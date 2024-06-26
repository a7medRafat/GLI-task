import 'package:flutter/cupertino.dart';
import 'package:gli/config/style/app_fonts.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text('Register', style: AppFonts.headline2),
    );
  }
}
