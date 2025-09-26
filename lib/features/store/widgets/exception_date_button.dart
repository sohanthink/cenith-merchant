import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/asstes_path/icons_path.dart';
import '../../../core/theme/text_theme.dart';

class ExceptionDateButton extends StatelessWidget {
  const ExceptionDateButton({super.key, required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: MediaQuery.of(context).size.width/2.4,
        // margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade500, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              IconsPath.calenderIconSvg,
              color: Colors.black,
              height: 20.h,
              width: 20.w,
            ),
            SizedBox(width: 10.w),
            Text(
              time,
              style: fontSize16(context)!.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
