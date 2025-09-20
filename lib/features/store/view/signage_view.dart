import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/image_paths.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignageView extends StatefulWidget {
  const SignageView({super.key});

  static final String name = 'signage-screen';

  @override
  State<SignageView> createState() => _SignageViewState();
}

class _SignageViewState extends State<SignageView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          space(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCircleImage(),
                space(16),
                Text(
                  'Get walk-in bonuses and more bookings by linking your signage',
                  textAlign: TextAlign.center,
                  style: fontSize16(context)?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.1.sp,
                  ),
                ),
                space(16),
                RichText(
                  text: TextSpan(
                    style: fontSize14(context),
                    children: [
                      TextSpan(
                        text:
                            'Start by scanning the QR code on your Bounce signage to link it to your store. ',
                      ),
                      TextSpan(
                        text: 'Benefits of linking signage',
                        style: fontSize14(
                          context,
                        )?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
                Center(
                  child: Text('6 signs linked', style: fontSize14(context)),
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Link Cenith signage'),
                ),
                space(16),
                _buildButton(onTap: () {}, buttonName: 'Print A Signage'),
                SizedBox(height: 24.h),
                Text(
                  'Your orders',
                  style: fontSize20(
                    context,
                  )?.copyWith(fontWeight: FontWeight.bold),
                ),
                space(16),
                Text(
                  'Check the status of recent orders, manage returns, and create new orders.',
                  style: fontSize14(context),
                ),
                space(16),
                _buildButton(onTap: () {}, buttonName: 'Order Tags & Signage'),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.r),
                        topLeft: Radius.circular(12.r),
                      ),
                      color: Colors.blue.shade100.withOpacity(0.2),
                    ),
                    child: Text(
                      'Signage and Status',
                      style: fontSize16(context)?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.1.sp,
                      ),
                    ),
                  ),
                ),
                space(16),
                _buildSignageAndStatus(
                  context,
                  signageTitle: 'Window sticker (back)',
                  unit: '1 unit',
                  status: 'Delivered',
                  onTap: () {},
                ),
                space(16),
                _buildSignageAndStatus(
                  context,
                  signageTitle: 'Mini sticker',
                  unit: '2 unit',
                  status: 'Delivered',
                  onTap: () {},
                ),
                space(16),
                _buildSignageAndStatus(
                  context,
                  signageTitle: 'Window sticker (front)',
                  unit: '1 unit',
                  status: 'Delivered',
                  onTap: () {},
                ),
                space(16),
                _buildSignageAndStatus(
                  context,
                  signageTitle: 'Reusable tags',
                  unit: '1 unit',
                  status: 'Delivered',
                  onTap: () {},
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue.shade100.withOpacity(0.2),
            child: Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.midLightBlue,
                      ),
                    ),
                    Text('Previous', style: fontSize14(context)),
                  ],
                ),
                SizedBox(width: 190.w),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward,
                        color: AppColors.midLightBlue,
                      ),
                    ),
                    Text('Next', style: fontSize14(context)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildCircleImage() {
  return Center(
    child: ClipOval(
      child: Container(
        height: 85.h,
        width: 85.w,
        decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.r,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Image.asset(ImagePaths.personDemo, fit: BoxFit.cover),
      ),
    ),
  );
}

Widget _buildButton({required VoidCallback onTap, required String buttonName}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.themColor,
      side: BorderSide(color: AppColors.themColor, width: 1.6.w),
      elevation: 0,
    ),
    onPressed: onTap,
    child: Text(buttonName),
  );
}

Widget _buildSignageAndStatus(
  BuildContext context, {
  required String signageTitle,
  required String unit,
  required String status,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              signageTitle,
              style: fontSize16(
                context,
              )?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.1.sp),
            ),
            Text(unit, style: fontSize14(context)),
          ],
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 10.h,
            bottom: 10.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.greenShade.shade200,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            status,
            style: fontSize14(
              context,
            )?.copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.1.sp),
          ),
        ),
        IconButton(onPressed: onTap, icon: Icon(Icons.arrow_forward_ios)),
      ],
    ),
  );
}

SizedBox space(double h) => SizedBox(height: h.h);
