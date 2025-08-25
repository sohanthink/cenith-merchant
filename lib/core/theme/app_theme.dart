import 'package:cenith_storage/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '';

class AppTheme{
  static ThemeData  get themeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.themColor,
      )
    );
}
}