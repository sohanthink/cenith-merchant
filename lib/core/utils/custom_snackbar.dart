import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

customSnackBar({required BuildContext context, required String title}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: fontSize14(context)!.copyWith(color: Colors.white),
      ),
      backgroundColor: AppColors.themeColor,
      duration: Duration(seconds: 2),
      padding: EdgeInsets.all(14),
      margin: EdgeInsets.symmetric(horizontal: 15),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
    ),
  );
}
