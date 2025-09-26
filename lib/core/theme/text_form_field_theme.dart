import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldTheme {
  static InputDecorationTheme get textFormFieldTheme {
    return InputDecorationTheme(
      enabledBorder: outlineInputBorder(),
      focusedBorder: outlineInputBorder(),
      errorBorder: outlineInputBorder(),
      filled: false,
      fillColor: Colors.white,
      outlineBorder: BorderSide.none,
    );
  }

  static OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(color: Colors.grey.shade500),
    );
  }
}
