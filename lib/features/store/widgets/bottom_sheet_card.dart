import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/text_theme.dart';

class BottomSheetCard extends StatelessWidget {
  const BottomSheetCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        Text(
          title,
          style: fontSize18(context)!.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h, width: double.infinity),
        Text(
          'Show where your business is relative to',
          style: fontSize14(context),
        ),
        Text('its surroundings', style: fontSize14(context)),
        SizedBox(height: 20.h),
        buildPictureCard(isSelected: true),
        SizedBox(height: 10.h),
        buildPictureCard(isSelected: false),
        SizedBox(height: 10.h),
      ],
    );
  }

  Widget buildPictureCard({required bool isSelected}) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 9.h),
          height: 150.h,
          child: null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.grey,
          ),
        ),
        Positioned(
          right: 16.w,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: isSelected
                ? Icon(
                    Icons.check_circle_rounded,
                    size: 35.w,
                    color: Colors.greenAccent,
                  )
                : Icon(Icons.cancel, size: 35.w, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
