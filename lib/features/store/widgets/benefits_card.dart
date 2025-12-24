import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BenefitCard extends StatelessWidget {
  const BenefitCard({super.key, required this.context, required this.benefits});

  final BuildContext context;
  final Map<String, dynamic> benefits;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
          top: 20.h,
          bottom: 15.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.r,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.midLightBlue.withOpacity(0.2),
              child: Icon(benefits['icon'], color: AppColors.themeColor),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    benefits['title'],
                    style: fontSize16(context)?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    benefits['description'],
                    maxLines: 3,
                    style: fontSize14(
                      context,
                    )?.copyWith(overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
