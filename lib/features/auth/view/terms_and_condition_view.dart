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
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 30,

        // title: Text(
        //   'Partner Terms and Condition',
        //   style: fontSize20(context)!.copyWith(fontWeight: FontWeight.bold),
        // ),
        // backgroundColor: Colors.white,
        // elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTopSection(context),
                      SizedBox(height: 24.h),
                      _buildConditionSection(context),
                      SizedBox(height: 32.h),
                      _buildFinalAcceptanceSection(context),
                    ],
                  ),
                ),
              ),
              _buildBottomSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Partner Terms and Condition',
          style: fontSize22(
            context,
          )!.copyWith(fontWeight: FontWeight.bold, color: AppColors.darkBlue),
        ),
        SizedBox(height: 12.h),
        RichText(
          text: TextSpan(
            style: fontSize14(context),
            children: [
              const TextSpan(text: 'By registering with '),
              TextSpan(
                text: 'Cenith Storage',
                style: fontSize14(context)!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.themeColor,
                ),
              ),
              const TextSpan(
                text:
                    ', you, as the Partner, confirm that you have read, understood, and expressly agree to be legally bound by these ',
              ),
              TextSpan(
                text: 'Partner Terms And Conditions.',
                style: fontSize14(context)!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.themeColor,
                ),
              ),
              const TextSpan(
                text:
                    ' If you do not agree, you must not proceed with registration.',
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
        _buildTermsAndConditionCard(
          context,
          conditionName: 'Commission',
          description:
              'You agree that Cenith Storage will pay you a commission for each successfully completed reservation at your location, according to the applicable commission structure.',
          icon: Icons.handshake_outlined,
        ),
        SizedBox(height: 16.h),
        _buildTermsAndConditionCard(
          context,
          conditionName: 'Security and Handling',
          description:
              'You, as the Partner, are fully responsible for the safe storage and handling of all luggage. Each booking must be verified upon customer arrival, properly tagged using Cenith Storage labels, and securely stored until collection.',
          icon: Icons.security_outlined,
        ),
        SizedBox(height: 16.h),
        _buildTermsAndConditionCard(
          context,
          conditionName: 'Payment',
          description:
              'You agree that commissions are calculated monthly and paid after verification of completed reservations and compliance with these Terms.',
          icon: Icons.payments_outlined,
        ),
      ],
    );
  }

  Widget _buildTermsAndConditionCard(
    BuildContext context, {
    required String conditionName,
    required String description,
    required IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.themeColor, size: 28.sp),
              SizedBox(width: 12.w),
              Text(
                conditionName,
                style: fontSize18(context)!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBlue,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            textAlign: TextAlign.justify,
            description,
            style: fontSize14(context),
          ),
        ],
      ),
    );
  }

  Widget _buildFinalAcceptanceSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Final Acceptance',
          style: fontSize18(
            context,
          )!.copyWith(fontWeight: FontWeight.bold, color: AppColors.darkBlue),
        ),
        SizedBox(height: 16.h),
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: fontSize14(context),
            children: [
              const TextSpan(text: 'By continuing, you confirm that '),
              TextSpan(
                text: 'you are the Partner',
                style: fontSize14(context)!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.themeColor,
                ),
              ),
              const TextSpan(
                text:
                    ', that you have read and understood these Terms & Conditions, and that you ',
              ),
              TextSpan(
                text: 'agree to be legally bound by them',
                style: fontSize14(context)!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.themeColor,
                ),
              ),
              const TextSpan(text: ' as well as by the '),
              TextSpan(
                text: 'Privacy Policy.',
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

  Widget _buildBottomSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.translate(
              offset: const Offset(-7, 0),
              child: Checkbox(
                value: _isChecked,
                activeColor: AppColors.themeColor,
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (v) {
                  _isChecked = v!;
                  setState(() {});
                },
              ),
            ),
            Text(
              'I agree to the Terms and Conditions',
              style: fontSize16(context)!.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.darkBlue,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        ElevatedButton(
          onPressed: _isChecked
              ? () {
                  Navigator.pushNamed(context, ConfirmationCodeEntryView.name);
                }
              : null,
          // style: ElevatedButton.styleFrom(
          //   backgroundColor: AppColors.themeColor,
          //   minimumSize: Size(double.infinity, 50.h),
          //   shape: RoundedRectangleBorder(
          //     // এখানে ভুলটি হয়েছিল, এখন ঠিক করে দেওয়া হয়েছে
          //     borderRadius: BorderRadius.circular(25.r),
          //   ),
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CONTINUE',
                // style: fontSize18(
                //   context,
                // )!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              // SizedBox(width: 8.w),
              // Icon(Icons.arrow_forward, color: Colors.white, size: 20.sp),
            ],
          ),
        ),
      ],
    );
  }
}
