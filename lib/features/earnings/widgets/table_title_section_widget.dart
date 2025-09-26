import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/text_theme.dart';
class TableTitleSectionWidget extends StatelessWidget {
  const TableTitleSectionWidget({super.key, required this.title1, required this.title2, required this.title3});

  final String title1;
  final String title2;
  final String title3;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        color: AppColors.themColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title1,
            style: fontSize16(context)!.copyWith(color: Colors.white),
          ),
          devider(),
          Text(
            title2,
            style: fontSize16(context)!.copyWith(color: Colors.white),
          ),
          devider(),
          Text(
            title3,
            style: fontSize16(context)!.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Container devider() {
    return Container(
          height: 60.h,
          width: 2.w,
          decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.circular(10),
          ),
        );
  }
}
