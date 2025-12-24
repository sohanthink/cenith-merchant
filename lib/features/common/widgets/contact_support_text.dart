import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactSupportText {
  static RichText supportText(BuildContext context, VoidCallback onTap) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.titleSmall,
        children: [
          TextSpan(text: 'Have question? '),
          TextSpan(
            text: 'Contact our support team',
            style: TextStyle(fontSize: 15.sp,color: AppColors.themeColor),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
