import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget spaceWidget({required bool isHeight, required double size}) {
  return isHeight
      ? SizedBox(
    height: size,
  )
      : SizedBox(
    width: size,
  );
}


