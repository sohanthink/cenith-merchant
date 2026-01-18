import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/features/auth/view/auth_view.dart';
import 'package:cenith_marchent/features/auth/view/sign_up_view.dart';
import 'package:cenith_marchent/features/main_bottom_nav/view/main_bottom_nav_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/text_theme.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  static const name = 'logInView';

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFF0F5FA), Color(0xFFE8F0F8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 130.h),
                SvgPicture.asset(IconsPath.appLogoSvg, height: 120, width: 120),
                SizedBox(height: 20.h),
                Text(
                  'Luggage storage near you',
                  style: fontSize16(
                    context,
                  )!.copyWith(color: Colors.grey, letterSpacing: 1),
                ),
                SizedBox(height: 100.h),
                _buildTextField(hint: 'hello@example.com'),
                SizedBox(height: 20.h),
                _buildTextField(hint: '••••••••', isPassword: true),
                SizedBox(height: 40.h),
                buildCustomButon(
                  title: 'Log in',
                  onTap: () {
                    Navigator.pushNamed(context, MainBottomNavView.name);
                  },
                  backgroundColor: AppColors.themeColor,
                  foregroundColor: Colors.white,
                ),

                SizedBox(height: 50.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AuthView.name);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.themeColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15.sp),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
        height: 45.h,
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
