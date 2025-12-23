import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/main_bottom_nav/view/main_bottom_nav_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmationCodeEntryView extends StatefulWidget {
  const ConfirmationCodeEntryView({super.key});

  static final String name = 'confirmation-code-entry-screen';

  @override
  State<ConfirmationCodeEntryView> createState() =>
      _ConfirmationCodeEntryViewState();
}

class _ConfirmationCodeEntryViewState extends State<ConfirmationCodeEntryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms & Condition',
          style: fontSize20(
            context,
          )!.copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
        ),

        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopSection(context),
            SizedBox(height: 32.h),
            _buildPinCodeFieldsSection(context),
            SizedBox(height: 32.h),
            _buildConfirmBtttonSection(context),
            SizedBox(height: 32.h),
            _buildDidnotCodeSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPinCodeFieldsSection(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 250.w,
        child: PinCodeTextField(
          length: 4,
          obscureText: false,
          keyboardType: TextInputType.number,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(25.r),
            fieldHeight: 80.h,
            fieldWidth: 50.w,
            activeFillColor: AppColors.themColor.shade300,
            activeColor: AppColors.themColor.shade300,
            // disabledColor: Colors.white,
            inactiveFillColor: AppColors.themColor.shade100,
            inactiveBorderWidth: 2.5.w,
            selectedFillColor: AppColors.themColor.shade100,
            selectedColor: AppColors.themColor,
            inactiveColor: AppColors.themColor,
          ),
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          appContext: context,
        ),
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Column(
      children: [
        Text(
          'Enter The Confirmation Code',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.1.sp,
            color: AppColors.darkBlue,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          'Enter the code to confirm your email.',
          style: fontSize14(
            context,
          )!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 16.h),
        Text(
          'INFOASRISLAMIOMAIL.COM',
          style: fontSize14(
            context,
          )!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildConfirmBtttonSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context,
            MainBottomNavView.name,
            (route) => false,
          ),
          child: Text('Confirm'),
        ),
        SizedBox(height: 24.h),
        Text(
          'Resend the confirmation code (54s)',
          style: fontSize14(context)!.copyWith(color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildDidnotCodeSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h, bottom: 8.h),
      decoration: BoxDecoration(
        color: AppColors.themColor.shade100,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: AppColors.themColor),
          SizedBox(width: 8.w),
          Text(
            "Didn't get the Code?",
            style: fontSize14(
              context,
            )!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          Text(
            ' try SMS',
            style: fontSize14(context)!.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
