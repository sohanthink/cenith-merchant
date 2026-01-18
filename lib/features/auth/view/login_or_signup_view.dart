import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/auth/view/auth_view.dart';
import 'package:cenith_marchent/features/auth/view/log_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginOrSignupView extends StatefulWidget {
  const LoginOrSignupView({super.key});

  static const name = 'loginOrSignUpView';

  @override
  State<LoginOrSignupView> createState() => _LoginOrSignupViewState();
}

class _LoginOrSignupViewState extends State<LoginOrSignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFC8E0F8), Color(0xFF9FCCF6)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 80.h),

                    SvgPicture.asset(
                      IconsPath.appLogoSvg,
                      height: 120.h,
                      width: 120.w,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Travel Lighter, explore further',
                      style: fontSize16(
                        context,
                      )!.copyWith(color: Colors.black45),
                    ),

                    SizedBox(height: 120.h),

                    Text(
                      'Welcome',
                      style: fontSize26(
                        context,
                      )!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Thousand of people storing their\nluggage safely',
                      textAlign: TextAlign.center,
                      style: fontSize16(context),
                    ),
                    SizedBox(height: 40.h),

                    buildCustomButon(
                      title: 'Create Account',
                      onTap: () {
                        Navigator.pushNamed(context, AuthView.name);
                      },
                      backgroundColor: AppColors.themeColor,
                      foregroundColor: Colors.white,
                    ),
                    SizedBox(height: 15.h),
                    buildCustomButon(
                      title: 'Sign In',
                      onTap: () {
                        Navigator.pushNamed(context, LogInView.name);
                      },
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 13),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('1.0.1', style: fontSize16(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCustomButon({
    required String title,
    required VoidCallback onTap,
    required Color backgroundColor,
    required Color foregroundColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            if (backgroundColor == Colors.white)
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.r,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: fontSize18(
            context,
          )!.copyWith(color: foregroundColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
