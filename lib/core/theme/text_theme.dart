import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

TextTheme get textTheme {
  return TextTheme(
    titleLarge: TextStyle(fontSize: 26.sp, color: AppColors.midLightBlue),
    headlineLarge: TextStyle(fontSize: 16.sp, color: AppColors.midLightBlue),
    bodyLarge: TextStyle(fontSize: 20.sp, color: AppColors.midLightBlue),
    titleMedium: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.normal,color: AppColors.midLightBlue),
    headlineMedium: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal,color: AppColors.midLightBlue),
    titleSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal,color: AppColors.midLightBlue),
  );
}



