import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({
    super.key,
    required this.color,
    required this.outerBorder,
  });
  final Color color;
  final bool outerBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: outerBorder
              ? Border.all(
                  color: color,
                  width: 2,
                )
              : null,
          shape: BoxShape.circle,
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ));
  }
}
