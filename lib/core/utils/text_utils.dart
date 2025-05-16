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
      this.textAlign,
      this.overflow});
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
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
