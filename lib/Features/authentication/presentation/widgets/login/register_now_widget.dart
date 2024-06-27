import 'package:flutter/material.dart';
import 'package:gli/config/style/app_fonts.dart';
import 'package:gli/core/go/go.dart';
import '../../screens/register_screen/register_screen.dart';

class RegisterNowWidget extends StatelessWidget {
  const RegisterNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?', style: AppFonts.regular1),
        TextButton(
            onPressed: () => Go.goTo(context, const RegisterScreen()),
            child: const Text('Register Now')),
      ],
    );
  }
}
