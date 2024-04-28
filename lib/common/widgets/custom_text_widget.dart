import 'package:dsd/common/styles/colors.dart';
import 'package:flutter/material.dart';

/* Custom Text Widget, shu widgetan foydalanib xoxlagan custom text yozsa boladi, parametrlani tog'ri chaqirilsa boldi */

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? customFontSize;
  final FontWeight? customFontWeight;
  final TextAlign? textAlign;
  final Color? textColor;

  const CustomTextWidget(
      {super.key,
      required this.text,
      this.customFontSize,
      this.customFontWeight,
      this.textAlign,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign ?? TextAlign.center,
      text,
      style: TextStyle(
        color: textColor ?? AppColors.white,
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
