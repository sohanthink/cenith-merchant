import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';

Widget topicHeader({
  required String title,
  required String subTitle,
  CrossAxisAlignment? crossAxisAlignment,
}) {
  return Column(
    crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          height: 0.7,
          color: AppColors.midLightBlue,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        subTitle,
        style: TextStyle(
          color: AppColors.midLightBlue.shade500,
          fontSize: 14.sp,
        ),
      ),
    ],
  );
}
