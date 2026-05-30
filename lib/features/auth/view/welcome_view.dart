import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  static final String name = 'welcome-screen';

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Spacer(),
              Text(
                'You\'re almost set!',
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 40.h),
                decoration: BoxDecoration(
                  color: AppColors.themeColor.shade100,
                  border: Border.all(color: Colors.black54, width: 1.w),
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  'We\'ve received your details. Your account is under review. in the meantime ,feel free to explore Cenith Storage.We\'ll let you know as soon as it\'s ready.',
                  style: fontSize20(
                    context,
                  )!.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Explore Partner Portal',
                  style: fontSize18(
                    context,
                  )!.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
