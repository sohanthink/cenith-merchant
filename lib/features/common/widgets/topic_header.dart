import 'package:cenith_marchent/core/font_family/font_family.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget topicHeader(
  context, {
  required String title,
  required String subTitle,
  CrossAxisAlignment? crossAxisAlignment,
}) {
  return Column(
    crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: fontSize20(context)!.copyWith(fontWeight: FontWeight.w500 ),

      ),
      Text(
        subTitle,
        style: fontSize14(context),

        /*TextStyle(
          color: AppColors.midLightBlue.shade500,
          fontSize: 14.sp,
        ),*/
      ),
    ],
  );
}
