import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_style.dart';

@immutable
class AppThemes {
  const AppThemes._();

  static ThemeData light() => ThemeData(
        textTheme: const AppTextStyle(),
        scaffoldBackgroundColor: AppColors.white,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.transparent,
        ),
        appBarTheme: const _AppBarTheme._(),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
        inputDecorationTheme: const _InputDecorationTheme._(),
      );

  static ThemeData dark() => light();
}

@immutable
class _AppBarTheme extends AppBarTheme {
  const _AppBarTheme._();

  @override
  double? get elevation => 0;

  @override
  bool? get centerTitle => true;

  @override
  Color? get backgroundColor => AppColors.white;

  @override
  IconThemeData? get actionsIconTheme => const IconThemeData(color: AppColors.black);

  @override
  IconThemeData? get iconTheme => const IconThemeData(color: AppColors.black);

  @override
  TextStyle? get titleTextStyle => const AppTextStyle().titleMedium;
}

@immutable
class _InputDecorationTheme extends InputDecorationTheme {
  const _InputDecorationTheme._();

  @override
  InputBorder? get border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      );

  @override
  EdgeInsetsGeometry? get contentPadding => const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      );

  @override
  InputBorder? get enabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.cEAEFF3,
          width: 1,
        ),
      );

  @override
  InputBorder? get errorBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.cE71010,
          width: 1,
        ),
      );

  @override
  Color? get fillColor => AppColors.white;

  @override
  bool get filled => true;

  @override
  InputBorder? get focusedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.c3554D1,
          width: 1,
        ),
      );

  @override
  TextStyle? get hintStyle =>  TextStyle(
        color: AppColors.c717394,
        fontSize: FontSize.size16,
        fontWeight: FontWeight.w400,
        // fontFamily: ,
      );
}
