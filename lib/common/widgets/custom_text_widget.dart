import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextWidget extends StatelessWidget {
  String text;
  double? customFontSize;
  FontWeight? customFontWeight;

  CustomTextWidget(
      {super.key, required this.text, customFontSize, customFontWeight});

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
