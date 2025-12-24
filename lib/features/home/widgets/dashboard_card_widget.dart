import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/booking/view/all_bookings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';

class BuildDashboardCard extends StatelessWidget {
  const BuildDashboardCard({
    super.key,
    required this.title,
    required this.count,
    required this.isSelected,
    this.subTitle,
  });

  final String title;
  final int count;
  final bool isSelected;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.r,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10.r),
        color: isSelected ? AppColors.themeColor : Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Stack(
          children: [
            Positioned(
              left: 20.w,
              top: 25.h,
              child: Text(
                title,
                style: fontSize16(
                  context,
                )!.copyWith(color: isSelected ? Colors.white : Colors.black),
              ),
            ),
            Positioned(
              left: 20.w,
              top: 45.h,
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 32.sp,
                ),
              ),
            ),
            isSelected
                ? Positioned(
                    left: 280.w,
                    top: -40.h,
                    child: CircleAvatar(
                      radius: 83.r,
                      backgroundColor: AppColors.midLightBlue,
                    ),
                  )
                : SizedBox.shrink(),
            isSelected
                ? Positioned(
                    left: 296.w,
                    top: -50.h,
                    child: CircleAvatar(
                      radius: 77.r,
                      backgroundColor: AppColors.darkBlue.shade200,
                    ),
                  )
                : SizedBox.shrink(),
            isSelected
                ? Positioned(
                    bottom: 6.h,
                    left: 105.w,
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, AllBookingsView.name),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          child: Text(
                            'View All Bookings',
                            style: fontSize16(
                              context,
                            )!.copyWith(color: AppColors.themeColor),
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            !isSelected && subTitle != null
                ? Positioned(
                    top: 90.h,
                    left: 20.w,
                    child: Text(
                      subTitle!,
                      style: TextTheme.of(context).titleSmall!.copyWith(),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
