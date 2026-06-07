import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/auth/view/log_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

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
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.themeColor,
                ),
              ),
              SizedBox(height: 25.h),
              Text(
                textAlign: TextAlign.center,
                'We\'ve received your details. Your account is under review. in the meantime ,feel free to explore Cenith Storage.We\'ll let you know as soon as it\'s ready.',
                style: fontSize14(
                  context,
                )!.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 12.h),
              Lottie.asset('assets/lottie/luggage.json'),

              Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  LogInView.name,
                  (predicate) => false,
                ),
                child: Text(
                  'Explore Partner Portal',
                  style: fontSize16(
                    context,
                  )!.copyWith(color: Colors.white,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
