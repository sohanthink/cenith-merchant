import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPreference extends StatelessWidget {
  const NotificationPreference({
    super.key,
    required this.buttonCategoryName,
    required this.context,
    required this.title,
    required this.directionText,
    required this.isSwitchOn,
    required this.onTapSwitch,
    required this.onTapNotificationType,
  });

  final List<String> buttonCategoryName;
  final BuildContext context;
  final String title;
  final String directionText;
  final bool isSwitchOn;
  final ValueChanged<bool> onTapSwitch;
  final ValueChanged<String> onTapNotificationType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15.h),
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: fontSize16(
                    context,
                  )?.copyWith(fontWeight: FontWeight.w600),
                ),
                Switch(
                  value: isSwitchOn,
                  onChanged: onTapSwitch,
                  activeColor: Colors.white,
                  activeTrackColor: AppColors.midLightBlue,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(directionText, style: fontSize12(context)),
            SizedBox(height: 24.h),
            Wrap(
              spacing: 10.w,
              runSpacing: 12.w,
              children: [
                ...buttonCategoryName.map((button) {
                  return InkWell(
                    onTap: ()=>onTapNotificationType(button),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: AppColors.midLightBlue,
                          width: 1.5.w,
                        ),
                      ),
                      child: Text(button, style: fontSize12(context)),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
