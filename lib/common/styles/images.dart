import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppImages {
  const AppImages._();

  // *** svg images

  static final svgImage = SvgPicture.asset(
    '',
    height: 24.w,
    width: 24.w,
  );


  ///**************************************************************************************

  // *** png images

  static final pngImage = Image.asset(
    '',
    height: 24.w,
    width: 24.w,
  );


}

extension Extension on Image {
  Image copyWith({
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) =>
      Image(
        image: image,
        width: width ?? this.width,
        height: height ?? this.height,
        fit: fit ?? this.fit,
        color: color ?? this.color,
      );
}
