import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimePickerBox extends StatelessWidget {
  final String label;
  final String time;
  final VoidCallback onTap;

  const TimePickerBox({
    super.key,
    required this.label,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          padding:  EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style:fontSize12(context),
              ),
               SizedBox(height: 4.h),
              Text(
                time,
                style: fontSize16(context)!.copyWith(fontWeight: FontWeight.bold)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
