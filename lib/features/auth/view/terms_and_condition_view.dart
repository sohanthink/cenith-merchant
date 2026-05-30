import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/auth/view/confirmation_code_entry_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionView extends StatefulWidget {
  const TermsAndConditionView({super.key});

  static final String name = 'terms-and-condition-screen';

  @override
  State<TermsAndConditionView> createState() => _TermsAndConditionViewState();
}

class _TermsAndConditionViewState extends State<TermsAndConditionView> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTopSection(context),
                SizedBox(height: 16.h),
                _buildConditionSection(context),
                SizedBox(height: 24.h),
                _buildFinalAcceptanceSection(context),
                SizedBox(height: 24.h),
                _buildBottomSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (v) {
                _isChecked = v!;
                setState(() {});
              },
            ),
            Text(
              'I agree Terms and Condition',
              style: fontSize16(
                context,
              )!.copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.1.sp),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        ElevatedButton(
          onPressed: _isChecked
              ? () {
                  if (_isChecked == true) {
                    AppColors.themeColor;
                  } else {
                    Colors.grey;
                  }
                  Navigator.pushNamed(context, ConfirmationCodeEntryView.name);
                }
              : null,
          child: Text('Continue'),
        ),
      ],
    );
  }

  Column _buildFinalAcceptanceSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Final Acceptance',
          style: fontSize20(context)!.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.h),
        RichText(
          text: TextSpan(
            style: fontSize14(context),
            children: [
              TextSpan(text: 'By continuing,you confirm that'),
              TextSpan(
                text: '  you are the Partner ',
                style: fontSize14(
                  context,
                )!.copyWith(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text:
                    'that you have read and understood these Terms & Conditions, and that you',
              ),
              TextSpan(
                text: ' agree to be legally bound by them',
                style: fontSize14(
                  context,
                )!.copyWith(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' as well as by the '),
              TextSpan(
                text: 'Privacy Policy',
                style: fontSize14(context)!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildConditionSection(BuildContext context) {
    return Column(
      children: [
        _buildTermsAndConditionSection(
          context,
          conditionName: '1. Commission',
          description:
              'You agree that Cenith Storage will pay you a commission for each successfully completed reservation at your location, according to the applicable commission structure.',
        ),
        _buildTermsAndConditionSection(
          context,
          conditionName: '2. Security and Handling',
          description:
              'You, as the Partner, are fully responsible for the safe storage and handling of all luggage. Each booking must be verified upon customer arrival, properly tagged using Cenith Storage labels, and securely stored until collection.',
        ),
        _buildTermsAndConditionSection(
          context,
          conditionName: '3. Payment',
          description:
              'You agree that commissions are calculated monthly and paid after verification of completed reservations and compliance with these Terms.',
        ),
      ],
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Partner Terms and Condition',
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.1.sp,
            color: AppColors.darkBlue,
          ),
        ),
        SizedBox(height: 10.h),
        RichText(
          text: TextSpan(
            style: fontSize14(context),

            children: [
              TextSpan(text: ' By registering with '),
              TextSpan(
                text: 'Cenith Storage',
                style: fontSize14(
                  context,
                )!.copyWith(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text:
                    ' you, as the Partner, confirm that you have read, understood, and expressly agree to be legally bound by these',
              ),
              TextSpan(
                text: ' Partner Terms And Conditions. ',
                style: fontSize14(context)!.copyWith(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'If you do not agree, you must not proceed with registration',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTermsAndConditionSection(
    BuildContext context, {
    required String conditionName,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          conditionName,
          style: fontSize20(context)!.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.h),
        Text(description, style: fontSize14(context)),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget _buildTermsAndConditionText(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22.r,
          backgroundColor: Colors.amber,
          child: Icon(icon, color: AppColors.darkBlue),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: fontSize14(
                context,
              )!.copyWith(color: Colors.black87, fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: title,
                  style: fontSize16(
                    context,
                  )!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                TextSpan(text: description),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
