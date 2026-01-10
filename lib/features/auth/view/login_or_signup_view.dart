import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
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
      body: Column(
        children: [
          Expanded(
            child: SvgPicture.asset(
              IconsPath.appLogoSvg,
              height: 150,
              width: 150,
            ),
          ),
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  SizedBox(height: 30.h),

                  buildActionButton(
                    title: 'Login',
                    onTap: () {
                      Navigator.pushNamed(context, LogInView.name);
                    },
                  ),
                  SizedBox(height: 20.h),

                  buildActionButton(
                    title: 'Sign Up',
                    onTap: () {
                      Navigator.pushNamed(context, AuthView.name);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildActionButton({
    required String title,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(15),
          ),
        ),
        onPressed: onTap,
        child: Text(title),
      ),
    );
  }
}
