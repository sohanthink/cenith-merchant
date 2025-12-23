import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldTheme {
  static InputDecorationTheme get textFormFieldTheme {
    return InputDecorationTheme(
      enabledBorder: outlineInputBorder(),
      focusedBorder: outlineInputBorder(),
      errorBorder: outlineInputBorder(),
      focusedErrorBorder: outlineInputBorder(),
      disabledBorder: outlineInputBorder(),
      errorMaxLines: 2,
      filled: true,
      fillColor: Colors.white,
      outlineBorder: BorderSide.none,
      hintStyle: TextStyle(
        fontSize: 16.sp,
        color: Colors.grey,
        letterSpacing: 0.1.sp,
        fontWeight: FontWeight.w400,
      ),
      errorStyle: TextStyle(
        fontSize: 14.sp,
        letterSpacing: 0.1.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(color: Colors.grey.shade500),
    );
  }
}
