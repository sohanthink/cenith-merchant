
import 'package:cenith_marchent/core/theme/custom_button_theme.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import '';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get themeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColors.themColor),
      textTheme: textTheme,
      elevatedButtonTheme: CustomButtonTheme.elevatedButtonThemeData()
    );
  }


}
