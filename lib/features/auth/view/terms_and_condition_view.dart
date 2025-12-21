import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/auth/view/confirmation_code_entry_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionView extends StatelessWidget {
  const TermsAndConditionView({super.key});

  static final String name = 'terms-and-condition-screen';

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Partner Terms and Condition',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.1.sp,
                  color: AppColors.darkBlue,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'To sign up with Bounce,you nedd to accept our',
                style: fontSize14(
                  context,
                )!.copyWith(color: Colors.black87, fontWeight: FontWeight.w500),
              ),
              Text(
                'Partner Terms and Condition.',
                style: fontSize14(context)!.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16.h),
              _buildTermsAndConditionText(
                context,
                icon: Icons.money,
                title: 'Commission.',
                description:
                    ' Bounce agree to pay a \ncommission on every reservation\ncompleted at your location',
              ),
              SizedBox(height: 16.h),
              _buildTermsAndConditionText(
                context,
                icon: Icons.security,
                title: 'Security.',
                description:
                    ' Securely store each bag.\nConfirm booking with the customers,\nattach Bounce bag tags,and keep them\nsafe until the customer returns',
              ),
              SizedBox(height: 16.h),
              _buildTermsAndConditionText(
                context,
                icon: Icons.monetization_on_outlined,
                title: 'Earnings.',
                description:
                    ' You will be paid monthly for\n your Bounce Storage revenue',
              ),
              SizedBox(height: 16.h),
              RichText(
                text: TextSpan(
                  style: fontSize14(
                    context,
                  )!.copyWith(color: Colors.black87, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(text: 'By proceeding you agree to our '),
                    TextSpan(
                      text: 'Partner Terms and Conditions ',
                      style: fontSize14(
                        context,
                      )!.copyWith(fontWeight: FontWeight.w500),
                    ),
                    TextSpan(text: 'and acknowledge that you have read our '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: fontSize14(
                        context,
                      )!.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, ConfirmationCodeEntryView.name),
                child: Text('Accept and Continue'),
              ),
            ],
          ),
        ),
      ),
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
        RichText(
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
      ],
    );
  }
}
