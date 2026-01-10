import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/features/main_bottom_nav/view/main_bottom_nav_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../core/theme/text_theme.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  static const name = 'Log in view';

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final TextEditingController _phoneTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80.h),
                Text(
                  'Sign in',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'We will a confirmation otp to your phone.',
                  style: fontSize16(context)!.copyWith(color: Colors.black54),
                ),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(text: 'Sign in with '),
                      TextSpan(
                        text: 'Email',
                        style: TextStyle(color: AppColors.themeColor),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 100),
                Text(
                  'Phone number',
                  style: fontSize14(context)!.copyWith(color: Colors.black54),
                ),
                SizedBox(height: 8),
                Form(child: _buildPhoneNumberField()),
                SizedBox(height: 30),
                buildActionButton(
                  child: Text(
                    'Login',
                    style: fontSize16(context)!.copyWith(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      MainBottomNavView.name,
                      (predicate) => false,
                    );
                  },
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey.shade400),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'or continue with',
                        style: fontSize14(
                          context,
                        )!.copyWith(color: Colors.grey.shade500),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey.shade400),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                buildActionButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(IconsPath.googleIconSvg, height: 30),
                      SizedBox(width: 10),
                      Text('Login with google'),
                    ],
                  ),
                  onTap: () {},
                ),

                SizedBox(height: 12),

                buildActionButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(IconsPath.appleIconSvg, height: 30),
                      SizedBox(width: 10),
                      Text('Log in with apple'),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return IntlPhoneField(
      countries: [
        Country(
          name: "United States",
          nameTranslations: {
            "en": "United States",
            "bn": "মার্কিন যুক্তরাষ্ট্র",
          },
          flag: "🇺🇸",
          code: "US",
          dialCode: "1",
          minLength: 10,
          maxLength: 10,
        ),
        Country(
          name: "United Kingdom",
          nameTranslations: {"en": "United Kingdom", "bn": "যুক্তরাজ্য"},
          flag: "🇬🇧",
          code: "GB",
          dialCode: "44",
          minLength: 10,
          maxLength: 10,
        ),
        Country(
          name: "Italy",
          nameTranslations: {"en": "Italy", "bn": "ইতালি"},
          flag: "🇮🇹",
          code: "IT",
          dialCode: "39",
          minLength: 10,
          maxLength: 10,
        ),
        Country(
          name: "France",
          nameTranslations: {"en": "France", "bn": "ফ্রান্স"},
          flag: "🇫🇷",
          code: "FR",
          dialCode: "33",
          minLength: 9,
          maxLength: 9,
        ),
        // Switzerland
        Country(
          name: "Switzerland",
          nameTranslations: {"en": "Switzerland", "bn": "সুইজারল্যান্ড"},
          flag: "🇨🇭",
          code: "CH",
          dialCode: "41",
          minLength: 9,
          maxLength: 9,
        ),
        // Austria
        Country(
          name: "Austria",
          nameTranslations: {"en": "Austria", "bn": "অস্ট্রিয়া"},
          flag: "🇦🇹",
          code: "AT",
          dialCode: "43",
          minLength: 10,
          maxLength: 13,
        ),
        // Germany
        Country(
          name: "Germany",
          nameTranslations: {"en": "Germany", "bn": "জার্মানি"},
          flag: "🇩🇪",
          code: "DE",
          dialCode: "49",
          minLength: 10,
          maxLength: 11,
        ),
        // Spain
        Country(
          name: "Spain",
          nameTranslations: {"en": "Spain", "bn": "স্পেন"},
          flag: "🇪🇸",
          code: "ES",
          dialCode: "34",
          minLength: 9,
          maxLength: 9,
        ),
      ],

      style: fontSize16(context),
      controller: _phoneTEController,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      dropdownIcon: const Icon(Icons.keyboard_arrow_down),
      initialCountryCode: 'IT',
      validator: (phone) {
        if (phone == null || phone.number.isEmpty) {
          return 'Phone number required';
        }
        final regex = RegExp(r'^\+?[1-9]\d{1,14}$');
        if (!regex.hasMatch(phone.completeNumber)) {
          return 'Invalid phone number';
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: Colors.red),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      ),
      dropdownTextStyle: fontSize16(context)?.copyWith(color: Colors.black),
      disableLengthCheck: true,
    );
  }

  Widget buildActionButton({
    required Widget child,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.themeColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(35),
          ),
        ),
        onPressed: onTap,
        child: child,
      ),
    );
  }
}
