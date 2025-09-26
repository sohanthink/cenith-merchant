import 'package:cenith_marchent/core/theme/custom_button_theme.dart';
import 'package:cenith_marchent/core/theme/text_form_field_theme.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get themeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColors.themColor),
      textTheme: textTheme,
      inputDecorationTheme: TextFormFieldTheme.textFormFieldTheme,
      elevatedButtonTheme: CustomButtonTheme.elevatedButtonThemeData(),
      scaffoldBackgroundColor: AppColors.scaffoldColor,


    );
  }
}
