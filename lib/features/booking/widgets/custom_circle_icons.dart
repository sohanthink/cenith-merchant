import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCircleIcons extends StatelessWidget {
    CustomCircleIcons({super.key, required this.icon,this.padding, required this.onTap});

  final String icon;
  double? padding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(4.w),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Padding(
          padding: EdgeInsets.all(padding??10.0.w),
          child: SvgPicture.asset(
            icon,
            width: 28.w,
            colorFilter: ColorFilter.mode(
              AppColors.midLightBlue,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
