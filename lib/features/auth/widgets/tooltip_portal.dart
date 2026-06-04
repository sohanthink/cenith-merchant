import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToolTipPortal extends StatelessWidget {
  const ToolTipPortal({
    super.key,
    required this.context,
    required this.toolTipTitle,
  });

  final BuildContext context;
  final String toolTipTitle;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolTipTitle,
      triggerMode: TooltipTriggerMode.tap,
      preferBelow: false,
      verticalOffset: 8.h,
      padding: EdgeInsets.all(12.r),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.r),
          topLeft: Radius.circular(8.r),
          bottomLeft: Radius.circular(8.r),
        ),

        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      textStyle: fontSize16(context)!.copyWith(
        color: Colors.white,

      ),
      child: Icon(
        Icons.info_outline,
        color: AppColors.themeColor.shade500,
      ),
    );
  }
}