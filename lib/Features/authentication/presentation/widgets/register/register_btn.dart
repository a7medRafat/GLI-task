import 'package:flutter/cupertino.dart';
import '../../../../../core/utiles/app_button.dart';

class RegisterBtn extends StatelessWidget {
  const RegisterBtn({super.key, required this.function});

  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AppButton(text: 'Register', fun: function),
    );
  }
}
