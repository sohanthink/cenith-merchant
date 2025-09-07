import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class CustomButtonTheme {
 static ElevatedButtonThemeData  elevatedButtonThemeData(){
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(350.w, 45.h),
        backgroundColor: AppColors.themColor,
        foregroundColor: Colors.white,
        textStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.1.sp
        ),
      ),
    );
  }


}