import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? customFontSize;
  final FontWeight? customFontWeight;

  CustomTextWidget(
      {super.key, required this.text, this.customFontSize, this.customFontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: customFontSize ?? 18,
        fontWeight: customFontWeight ?? FontWeight.w500,
      ),
    );
  }
}

Widget customTextWidget(
    {required String text,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color}) {
  return Text(
    text,
    style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize ?? 18,
        fontWeight: fontWeight ?? FontWeight.w500),
  );
}
