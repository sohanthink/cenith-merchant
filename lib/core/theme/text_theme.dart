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

TextStyle? fontSize26(context){
  return TextTheme.of(context).titleLarge;
}
TextStyle? fontSize16(context){
  return TextTheme.of(context).headlineLarge;
}
TextStyle? fontSize20(context){
  return TextTheme.of(context).bodyLarge;
}
TextStyle? fontSize24(context){
  return TextTheme.of(context).titleMedium;
}
TextStyle? fontSize12(context){
  return TextTheme.of(context).headlineMedium;
}
TextStyle? fontSize14(context){
  return TextTheme.of(context).titleSmall;
}



