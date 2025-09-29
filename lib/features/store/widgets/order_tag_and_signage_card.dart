import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/image_paths.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderTagAndSignageCard extends StatelessWidget {
  const OrderTagAndSignageCard({
    super.key,
    required this.orderTagName,
    required this.orderLength,
    required this.orderDescription,
  });

  final String orderTagName;
  final String orderLength;
  final String orderDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h, bottom: 24.h),
      width: double.infinity,
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 200.h,
                width: 320.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Image.asset(ImagePaths.bagImagePng, fit: BoxFit.fill),
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: Text(
                '315 in x 472 in (8 cm x 12 cm)',
                style: fontSize12(
                  context,
                )?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.1.sp),
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              orderTagName,
              style: fontSize16(
                context,
              )?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.1.sp),
            ),
            SizedBox(height: 16.h),
            RichText(
              text: TextSpan(
                style: fontSize14(context),
                children: [
                  TextSpan(text: 'Order Limit:'),
                  TextSpan(
                    text: orderLength,
                    style: fontSize14(context)?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              orderDescription,
              maxLines: 2,
              style: fontSize12(context)?.copyWith(
                color: AppColors.midLightBlue,
                letterSpacing: 0.1.sp,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
