import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  const TextUtils(
      {super.key,
      this.decoration,
      required this.text,
      required this.fontSize,
      required this.color,
      required this.fontWeight,
      this.decorationColor,
      this.textAlign});
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        decoration: decoration,
        color: color,
        decorationColor: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
