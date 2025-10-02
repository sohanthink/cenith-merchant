import 'dart:io';

import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/image_paths.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/common/widgets/contact_support_text.dart';
import 'package:cenith_marchent/features/store/widgets/order_tag_and_signage_card.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class OrderTagAndSignageView extends StatefulWidget {
  const OrderTagAndSignageView({super.key});

  static final String name = 'order-tag-and-signage-screen';

  @override
  State<OrderTagAndSignageView> createState() => _OrderTagAndSignageViewState();
}

class _OrderTagAndSignageViewState extends State<OrderTagAndSignageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Tags & Signage',
          style: fontSize16(
            context,
          )?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.1.sp),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close, color: AppColors.themColor),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                'You can select more than 1 signage type.',
                style: fontSize14(
                  context,
                )?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.1.sp),
              ),
              SizedBox(height: 16.h),
              OrderTagAndSignageCard(
                orderTagName: 'Reusable Tags',
                orderLength: '60 Per Year',
                orderDescription:
                    'Reusable security tags to attach to bags from number 1 to 60.',
              ),
              SizedBox(height: 16.h),
              OrderTagAndSignageCard(
                orderTagName: 'Reusable Tags',
                orderLength: '60 Per Year',
                orderDescription:
                    'Reusable security tags to attach to bags from number 1 to 60.',
              ),
              SizedBox(height: 16.h),
              OrderTagAndSignageCard(
                orderTagName: 'Reusable Tags',
                orderLength: '60 Per Year',
                orderDescription:
                    'Reusable security tags to attach to bags from number 1 to 60.',
              ),
              SizedBox(height: 16.h),
              OrderTagAndSignageCard(
                orderTagName: 'Reusable Tags',
                orderLength: '60 Per Year',
                orderDescription:
                    'Reusable security tags to attach to bags from number 1 to 60.',
              ),

              SizedBox(height: 16.h),
              OrderTagAndSignageCard(
                orderTagName: 'Reusable Tags',
                orderLength: '60 Per Year',
                orderDescription:
                    'Reusable security tags to attach to bags from number 1 to 60.',
              ),
              SizedBox(height: 24.h),
              ElevatedButton(onPressed: () {}, child: Text('Continue')),
              SizedBox(height: 32.h),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Having issues ordering what you need?',
                      style: fontSize12(context)?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.midLightBlue.shade400,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Contact our support team',
                      style: fontSize12(
                        context,
                      )?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h,)
            ],
          ),
        ),
      ),
    );
  }
}
