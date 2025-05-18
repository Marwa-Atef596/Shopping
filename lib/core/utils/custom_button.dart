import 'package:flutter/material.dart';

import '../theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.child,
    this.padding,
  });
  final void Function()? onPressed;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: padding,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
