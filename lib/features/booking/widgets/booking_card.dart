import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/booking/view/booking_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
    required this.title,
    required this.status,
    required this.date,
    required this.id,
    required this.bags,
  });

  final String title;
  final String status;
  final String date;
  final String id;
  final int bags;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BookingDetailsView.name);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(13.w),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  spacing: 5.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title.length >= 20
                              ? '${title.substring(0, 19)}..'
                              : title,
                          style: TextTheme.of(context).headlineLarge!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.themeColor.shade50,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 5,
                            ),
                            child: Text(
                              status,
                              style: TextTheme.of(context).headlineMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      date,
                      style: TextTheme.of(
                        context,
                      ).titleSmall!.copyWith(fontWeight: FontWeight.w300),
                    ),
                    Text(
                      id,
                      style: fontSize16(context)
                    ),
                  ],
                ),
              ),
              SizedBox(width: 5),
              Container(
                height: 60.h,
                width: 1.w,
                color: Colors.grey.shade400,
              ),
              SizedBox(width: 6),
              Column(
                children: [
                  Text(
                    bags.toString(),
                    style: TextTheme.of(
                      context,
                    ).titleSmall!.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Bags',
                    style: TextTheme.of(
                      context,
                    ).titleSmall!.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
