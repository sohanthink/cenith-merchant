import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

TextTheme get textTheme {
  return TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 26.sp,
      color: Colors.black,
    ),
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 20.sp,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headlineSmall: TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 19.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  );
}

TextStyle? fontSize26(context) {
  return TextTheme.of(context).titleLarge;
}

TextStyle? fontSize16(context) {
  return TextTheme.of(context).headlineLarge;
}

TextStyle? fontSize20(context) {
  return TextTheme.of(context).bodyLarge;
}

TextStyle? fontSize24(context) {
  return TextTheme.of(context).titleMedium;
}

TextStyle? fontSize12(context) {
  return TextTheme.of(context).headlineMedium;
}

TextStyle? fontSize14(context) {
  return TextTheme.of(context).titleSmall;
}

TextStyle? fontSize17(context) {
  return TextTheme.of(context).headlineSmall;
}

TextStyle? fontSize18(context) {
  return TextTheme.of(context).bodyMedium;
}

TextStyle? fontSize19(context) {
  return TextTheme.of(context).bodySmall;
}
