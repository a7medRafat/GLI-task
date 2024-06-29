import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 3.0,
      ),
    );
  }
}
