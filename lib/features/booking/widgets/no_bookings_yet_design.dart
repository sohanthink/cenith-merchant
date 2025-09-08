import 'package:cenith_marchent/features/common/contact_support_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoBookingsYetDesign extends StatelessWidget {
  const NoBookingsYetDesign({
    super.key,
    required this.style,
  });

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 32.h),
        Center(
          child: Container(
            height: 150.h,
            width: 150.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade400.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.shopping_bag,
              size: 70.sp,
              color: Colors.orange,
            ),
          ),
        ),
        SizedBox(height: 32.h),
        Text(
          'No Bookings yet',
          style: style.headlineLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Text(
            'When customers book your location, they will appear here.',
            style: style.titleSmall,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 12.h,),
        RichText(
          text: TextSpan(
            style: style.titleSmall,
            children: [
              TextSpan(
                text: 'Pro tip: ',
                style: style.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(text: 'never accept cash from customers.'),
            ],
          ),
        ),
        SizedBox(height: 40.h,),
        ContactSupportText.supportText(context, (){}),
        SizedBox(height: 80.h,),
        ElevatedButton(onPressed: (){}, child: Text('Check in/out'))
      ],
    );
  }
}