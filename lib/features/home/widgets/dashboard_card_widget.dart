import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
class BuildDashboardCard extends StatelessWidget {
 const BuildDashboardCard({
    super.key, required this.title, required this.count, required this.isSelected,
  });
  final String title;
  final int count;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected? AppColors.themColor:Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Positioned(
              left: 20.w,
              top: 25.h,
              child: Text(
                title,
                style: TextStyle(
                  color: isSelected? Colors.white:AppColors.themColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 20.w,
              top: 50.h,
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: isSelected? Colors.white:AppColors.themColor,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          isSelected?  Positioned(
              left: 280.w,
              top: -40.h,
              child: CircleAvatar(
                radius: 83.r,
                backgroundColor: AppColors.midLightBlue,
              ),
            ):SizedBox.shrink(),
           isSelected? Positioned(
              left: 296.w,
              top: -50.h,
              child: CircleAvatar(
                radius: 77.r,
                backgroundColor: AppColors.darkBlue.shade200,
              ),
            ):SizedBox.shrink(),
           isSelected? Positioned(
              top: 75.h,
              left: 105.w,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Text('View All Bookings',style: TextStyle(color: AppColors.themColor,fontWeight: FontWeight.bold),),
                ),
              ),
            ):SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}