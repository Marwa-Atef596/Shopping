import 'package:flutter/material.dart';

class CustomWelcomeContainer extends StatelessWidget {
  const CustomWelcomeContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
